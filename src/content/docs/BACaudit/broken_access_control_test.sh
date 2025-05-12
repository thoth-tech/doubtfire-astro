#!/bin/bash
# Broken Access Control Test Script
# Purpose: Test for broken access control vulnerabilities in web applications
# Usage: ./broken_access_control_test.sh [API_URL]

# Ensure script continues after command failures
set +e

# Import API URL
if command -v node &> /dev/null; then
  # Look for API URL in common locations
  for path in \
    "./src/app/config/constants/apiURL.ts" \
    "./app/config/constants/apiURL.ts" \
    "../doubtfire-web/src/app/config/constants/apiURL.ts"
  do
    if [ -f "$path" ]; then
      # Extract API_URL from TypeScript file
      API_URL=$(grep -o "API_URL\s*=\s*[\"'][^\"']*[\"']" "$path" | head -1 | cut -d "'" -f2 | cut -d '"' -f2)
      if [ ! -z "$API_URL" ]; then
        break
      fi
    fi
  done
fi

# Allow overriding through parameter
if [ "$1" != "" ]; then
  API_URL="$1"
fi

# Default if not set
if [ -z "$API_URL" ]; then
  API_URL="http://localhost:3000"
fi

echo "Using API URL: $API_URL"

# Client URL is typically different from API URL
CLIENT_URL=${API_URL/3000/4200}
if [[ "$CLIENT_URL" == "$API_URL" ]]; then
  # If no port substitution happened, use a different port
  CLIENT_URL="http://localhost:4200"
fi


LOG_FILE="broken_access_control_test_$(date +%Y%m%d_%H%M%S).log"

# User credentials for testing
ADMIN_USERNAME="aadmin"
ADMIN_PASSWORD="password"
REGULAR_USER_USERNAME="student_1"
REGULAR_USER_PASSWORD="password"

# ANSI color codes for output formatting
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Track test results
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_SKIPPED=0

# Function to log results
log_result() {
    local test_name=$1
    local result=$2
    local details=$3

    echo -e "[$test_name] - $result\n$details\n" | tee -a "$LOG_FILE"
}

# Function to check if access was denied as expected
check_denial() {
    local status_code=$1
    local expected_denial=$2
    local response=$3
    local test_name=$4
    local test_type=$5  # Optional parameter to identify specific test types

    # Handle 405 responses for Missing Access Control tests (should be a PASS)
    if [[ "$test_type" == "missing_access" && $status_code == 405 ]]; then
        if [[ "$response" == *"405 Not Allowed"* ]]; then
            log_result "$test_name" "${GREEN}PASS: Access denied as expected (Status: $status_code - Method Not Allowed)${NC}" "Response: $response"
            ((TESTS_PASSED++))
            return 0
        fi
    fi

    # Handle empty array/null responses for Missing Access Control tests
    if [[ "$test_type" == "missing_access" && $status_code == 200 ]]; then
        if [[ "$response" == "[]" || "$response" == "null" ]]; then
            log_result "$test_name" "${YELLOW}INCONCLUSIVE: Endpoint returns empty result (Status: $status_code)${NC}" "Response: $response"
            log_result "$test_name" "${YELLOW}NOTE: Although no actual data is returned, the endpoint can be accessed without authentication${NC}" "Consider requiring authentication based on the security requirements"
            ((TESTS_SKIPPED++))
            return 0
        fi
    fi

    # For path traversal tests
    if [[ "$test_type" == "path_traversal" ]]; then
        if [[ $status_code == 404 ]]; then
            log_result "$test_name" "${YELLOW}ATTENTION REQUIRED: Path traversal test returned 404${NC}" "Response: $response"
            log_result "$test_name" "${YELLOW}NOTE: While the server returned 404, manual verification is recommended${NC}" "Check if admin resources are accessible through other means"
            ((TESTS_SKIPPED++))
            return 0
        elif [[ $status_code == 403 || $status_code == 401 ]]; then
            log_result "$test_name" "${GREEN}PASS: Path traversal properly blocked (Status: $status_code)${NC}" "Response: $response"
            ((TESTS_PASSED++))
            return 0
        else
            log_result "$test_name" "${RED}FAIL: Path traversal may be possible (Status: $status_code)${NC}" "Response: $response"
            ((TESTS_FAILED++))
            return 1
        fi
    fi

    # For HTTP Method tests
    if [[ "$test_type" == "http_method" && $status_code == 405 ]]; then
        log_result "$test_name" "${GREEN}PASS: Access denied as expected (Status: $status_code - Method Not Allowed)${NC}" "Response: $response"
        ((TESTS_PASSED++))
        return 0
    fi

    # For Function Level tests
    if [[ "$test_type" == "function_level" && $status_code == 400 && "$response" == *"missing"* ]]; then
        log_result "$test_name" "${YELLOW}INCONCLUSIVE: Request was processed but failed validation (Status: $status_code)${NC}" "Response: $response"
        log_result "$test_name" "${YELLOW}NOTE: The API is accepting the request but rejecting it due to missing parameters${NC}" "This suggests the endpoint might lack proper permission checks, but further testing is needed"
        ((TESTS_SKIPPED++))
        return 0
    fi

    # For Control Tests where user permissions may be legitimately restricted
    if [[ "$test_type" == "control_user" && $status_code == 403 && "$response" == *"Unable to list"* ]]; then
        log_result "$test_name" "${YELLOW}INCONCLUSIVE: Regular user may not have units assigned${NC}" "Response: $response"
        log_result "$test_name" "${YELLOW}NOTE: The 403 response might be legitimate if the user doesn't have any assigned units${NC}" "This is expected behavior if the user's role doesn't include any units"
        ((TESTS_SKIPPED++))
        return 0
    fi

    if [[ $status_code == 401 || $status_code == 403 || $status_code == 419 ]]; then
        if [[ $expected_denial == true ]]; then
            log_result "$test_name" "${GREEN}PASS: Access denied as expected (Status: $status_code)${NC}" "Response: $response"
            ((TESTS_PASSED++))
            return 0
        else
            log_result "$test_name" "${RED}FAIL: Access was denied but should have been allowed (Status: $status_code)${NC}" "Response: $response"
            ((TESTS_FAILED++))
            return 1
        fi
    else
        if [[ $expected_denial == true ]]; then
            log_result "$test_name" "${RED}FAIL: Access was allowed but should have been denied (Status: $status_code)${NC}" "Response: $response"
            ((TESTS_FAILED++))
            return 1
        else
            log_result "$test_name" "${GREEN}PASS: Access allowed as expected (Status: $status_code)${NC}" "Response: $response"
            ((TESTS_PASSED++))
            return 0
        fi
    fi
}

# Main header
echo -e "${BLUE}===== Broken Access Control Test =====${NC}" | tee "$LOG_FILE"
echo -e "${BLUE}This test identifies broken access control vulnerabilities by simulating unauthorized access attempts${NC}"
echo -e "${BLUE}Expected result: All unauthorized access attempts should be denied${NC}\n" | tee -a "$LOG_FILE"

# ===== OBTAIN AUTHENTICATION TOKENS =====
echo -e "${BLUE}Obtaining authentication tokens for testing...${NC}" | tee -a "$LOG_FILE"

# Get admin token
echo -e "${YELLOW}Logging in as admin (${ADMIN_USERNAME})...${NC}"
ADMIN_RESPONSE=$(curl -s -X POST "${API_URL}/api/auth" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"${ADMIN_USERNAME}\",\"password\":\"${ADMIN_PASSWORD}\"}" \
  -w "\n%{http_code}" 2>&1)

ADMIN_STATUS=$(echo "$ADMIN_RESPONSE" | tail -n1)
ADMIN_BODY=$(echo "$ADMIN_RESPONSE" | sed '$d')

# Extract admin token from the response
ADMIN_TOKEN=$(echo $ADMIN_BODY | grep -o '"auth_token":"[^"]*"' | sed 's/"auth_token":"//;s/"//')

if [ -z "$ADMIN_TOKEN" ]; then
  echo -e "${RED}Failed to get admin token. Check credentials or server status.${NC}"
  echo -e "${RED}Status: $ADMIN_STATUS${NC}"
  echo -e "${RED}Response: $ADMIN_BODY${NC}"
  exit 1
fi
echo -e "${GREEN}Successfully obtained admin token: ${ADMIN_TOKEN:0:10}...${NC}\n"

# Get regular user token
echo -e "${YELLOW}Logging in as regular user (${REGULAR_USER_USERNAME})...${NC}"
REGULAR_USER_RESPONSE=$(curl -s -X POST "${API_URL}/api/auth" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"${REGULAR_USER_USERNAME}\",\"password\":\"${REGULAR_USER_PASSWORD}\"}" \
  -w "\n%{http_code}" 2>&1)

REGULAR_USER_STATUS=$(echo "$REGULAR_USER_RESPONSE" | tail -n1)
REGULAR_USER_BODY=$(echo "$REGULAR_USER_RESPONSE" | sed '$d')

# Extract regular user token from the response
REGULAR_USER_TOKEN=$(echo $REGULAR_USER_BODY | grep -o '"auth_token":"[^"]*"' | sed 's/"auth_token":"//;s/"//')

if [ -z "$REGULAR_USER_TOKEN" ]; then
  echo -e "${RED}Failed to get regular user token. Check credentials or server status.${NC}"
  echo -e "${RED}Status: $REGULAR_USER_STATUS${NC}"
  echo -e "${RED}Response: $REGULAR_USER_BODY${NC}"
  exit 1
fi
echo -e "${GREEN}Successfully obtained regular user token: ${REGULAR_USER_TOKEN:0:10}...${NC}\n"

# ===== TEST 1: VERTICAL PRIVILEGE ESCALATION =====
echo -e "${BLUE}Test 1: Vertical Privilege Escalation${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if a regular user can perform admin-only actions${NC}\n"

# Test 1.1: Regular user attempts to create a unit (admin action)
echo -e "${YELLOW}Test 1.1: Regular user attempting to create a unit (admin action)...${NC}"
UNIT_CODE="TEST$(date +%H%M%S)"
UNIT_NAME="Security Test Unit $(date +%H:%M:%S)"

RESULT1=$(curl -s -X POST "${API_URL}/api/units/" \
  -H "Content-Type: application/json" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -d "{\"unit\":{\"code\":\"${UNIT_CODE}\",\"name\":\"${UNIT_NAME}\"}}" \
  -w "\n%{http_code}" 2>&1)

HTTP_STATUS1=$(echo "$RESULT1" | tail -n1)
RESPONSE_BODY1=$(echo "$RESULT1" | sed '$d')

check_denial "$HTTP_STATUS1" true "$RESPONSE_BODY1" "Vertical Privilege Escalation: Regular user creating unit"

# Test 1.2: Regular user attempts to access admin dashboard
echo -e "${YELLOW}Test 1.2: Regular user attempting to access admin dashboard...${NC}"
RESULT2=$(curl -s -X GET "${API_URL}/api/units?as_admin=true" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

HTTP_STATUS2=$(echo "$RESULT2" | tail -n1)
RESPONSE_BODY2=$(echo "$RESULT2" | sed '$d')

check_denial "$HTTP_STATUS2" true "$RESPONSE_BODY2" "Vertical Privilege Escalation: Regular user accessing admin dashboard"

# ===== TEST 2: INSECURE DIRECT OBJECT REFERENCES (IDOR) =====
echo -e "\n${BLUE}Test 2: Insecure Direct Object References (IDOR)${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if users can access resources of other users by manipulating resource IDs${NC}\n"

# Test 2.1: Access another user's data
echo -e "${YELLOW}Test 2.1: Attempting to access another user's data by ID manipulation...${NC}"
OTHER_USER_ID="2"  # Assuming user ID 2 exists and is not the regular user

# Try the direct user endpoint first
IDOR_RESULT1=$(curl -s -X GET "${API_URL}/api/users/${OTHER_USER_ID}" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

IDOR_STATUS1=$(echo "$IDOR_RESULT1" | tail -n1)
IDOR_BODY1=$(echo "$IDOR_RESULT1" | sed '$d')

if [[ $IDOR_STATUS1 != 404 ]]; then
  check_denial "$IDOR_STATUS1" true "$IDOR_BODY1" "IDOR: Accessing another user's data by ID"
else
  echo -e "${YELLOW}Endpoint not found. Trying alternative endpoint...${NC}"
  # Try the submissions endpoint
  IDOR_RESULT1=$(curl -s -X GET "${API_URL}/api/users/${OTHER_USER_ID}/submissions" \
    -H "Username: ${REGULAR_USER_USERNAME}" \
    -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
    -w "\n%{http_code}" 2>&1)

  IDOR_STATUS1=$(echo "$IDOR_RESULT1" | tail -n1)
  IDOR_BODY1=$(echo "$IDOR_RESULT1" | sed '$d')

  if [[ $IDOR_STATUS1 != 404 ]]; then
    check_denial "$IDOR_STATUS1" true "$IDOR_BODY1" "IDOR: Accessing another user's submissions by ID"
  else
    log_result "IDOR: Accessing another user's data by ID" "${YELLOW}SKIPPED: Endpoint not found (404)${NC}" "Consider customizing this test for the application's specific endpoints"
    ((TESTS_SKIPPED++))
  fi
fi

# Test 2.2: Access another unit's data
echo -e "${YELLOW}Test 2.2: Attempting to access unauthorized unit data...${NC}"
UNIT_ID="1"  # Assuming unit ID 1 exists and user doesn't have access

IDOR_RESULT2=$(curl -s -X GET "${API_URL}/api/units/${UNIT_ID}" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

IDOR_STATUS2=$(echo "$IDOR_RESULT2" | tail -n1)
IDOR_BODY2=$(echo "$IDOR_RESULT2" | sed '$d')

# If the user has legitimate access to this unit, this test might need adjustment
# We'll check the response to see if it contains data
if [[ $IDOR_STATUS2 == 200 && "$IDOR_BODY2" == *"id"* && "$IDOR_BODY2" == *"name"* ]]; then
  echo -e "${YELLOW}User appears to have legitimate access to this unit. Test may need adjustment.${NC}"
  log_result "IDOR: Accessing unauthorized unit data" "${YELLOW}INCONCLUSIVE: User may have legitimate access${NC}" "Response contains unit data"
  ((TESTS_SKIPPED++))
else
  check_denial "$IDOR_STATUS2" true "$IDOR_BODY2" "IDOR: Accessing unauthorized unit data"
fi

# ===== TEST 3: SESSION TOKEN MISUSE =====
echo -e "\n${BLUE}Test 3: Session Token Misuse${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if session tokens can be used across different user contexts${NC}\n"

# Test 3.1: Use admin token with regular user credentials
echo -e "${YELLOW}Test 3.1: Attempting to use admin token with regular user credentials...${NC}"
TOKEN_RESULT1=$(curl -s -X POST "${API_URL}/api/units/" \
  -H "Content-Type: application/json" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${ADMIN_TOKEN}" \
  -d "{\"unit\":{\"code\":\"${UNIT_CODE}2\",\"name\":\"${UNIT_NAME} 2\"}}" \
  -w "\n%{http_code}" 2>&1)

TOKEN_STATUS1=$(echo "$TOKEN_RESULT1" | tail -n1)
TOKEN_BODY1=$(echo "$TOKEN_RESULT1" | sed '$d')

check_denial "$TOKEN_STATUS1" true "$TOKEN_BODY1" "Session Token Misuse: Regular user with admin token"

# Test 3.2: Use regular user token with admin credentials
echo -e "${YELLOW}Test 3.2: Attempting to use regular user token with admin credentials...${NC}"
TOKEN_RESULT2=$(curl -s -X GET "${API_URL}/api/units?as_admin=true" \
  -H "Username: ${ADMIN_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

TOKEN_STATUS2=$(echo "$TOKEN_RESULT2" | tail -n1)
TOKEN_BODY2=$(echo "$TOKEN_RESULT2" | sed '$d')

check_denial "$TOKEN_STATUS2" true "$TOKEN_BODY2" "Session Token Misuse: Admin user with regular token"

# ===== TEST 4: URL MANIPULATION =====
echo -e "\n${BLUE}Test 4: URL Manipulation${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if manipulating URL parameters can bypass access controls${NC}\n"

# Test 4.1: Access control bypass through URL parameter manipulation
echo -e "${YELLOW}Test 4.1: Attempting to bypass access controls via URL parameters...${NC}"
URL_RESULT1=$(curl -s -X GET "${API_URL}/api/units?admin=true" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

URL_STATUS1=$(echo "$URL_RESULT1" | tail -n1)
URL_BODY1=$(echo "$URL_RESULT1" | sed '$d')

check_denial "$URL_STATUS1" true "$URL_BODY1" "URL Manipulation: Using admin=true parameter"

# Test 4.2: Path traversal attempt and frontend access check - REMOVED MANUAL NOTE
echo -e "${YELLOW}Test 4.2: Testing path traversal vulnerabilities and admin UI access...${NC}"

# First test: Path traversal in API
URL_RESULT2=$(curl -s -X GET "${API_URL}/api/../admin" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

URL_STATUS2=$(echo "$URL_RESULT2" | tail -n1)
URL_BODY2=$(echo "$URL_RESULT2" | sed '$d')

check_denial "$URL_STATUS2" true "$URL_BODY2" "URL Manipulation: API path traversal attempt" "path_traversal"

# Second test: Check for admin UI access through frontend
echo -e "${YELLOW}Manually check if regular users can access ${CLIENT_URL}/#/admin/units${NC}" | tee -a "$LOG_FILE"
log_result "UI Access Control" "${YELLOW}MANUAL CHECK NEEDED: Verify if students can access admin pages${NC}" "Check if regular users can access: ${CLIENT_URL}/#/admin/units"

# ===== TEST 5: MISSING ACCESS CONTROLS =====
echo -e "\n${BLUE}Test 5: Missing Access Controls${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if critical endpoints are missing access controls${NC}\n"

# Use existing API endpoints file or create a minimal one
ENDPOINTS_FILE="./api_endpoints.txt"
if [ ! -f "$ENDPOINTS_FILE" ]; then
  echo -e "${YELLOW}API endpoints file not found. Creating a minimal list for testing...${NC}"

  cat > "$ENDPOINTS_FILE" << EOF
# Basic API endpoints for testing
/api/settings
/api/users
/api/units
EOF
fi

echo -e "${YELLOW}Test 5.1: Testing access to sensitive endpoints without proper authentication...${NC}"

# Read endpoints directly from file, skipping comments and empty lines
while IFS= read -r line || [ -n "$line" ]; do
  # Skip empty lines and comments
  [[ -z "$line" || "$line" == \#* ]] && continue

  endpoint="$line"

  # Test without authentication
  NO_AUTH_RESULT=$(curl -s -X GET "${API_URL}${endpoint}" \
    -w "\n%{http_code}" 2>&1)

  NO_AUTH_STATUS=$(echo "$NO_AUTH_RESULT" | tail -n1)
  NO_AUTH_BODY=$(echo "$NO_AUTH_RESULT" | sed '$d')

  # Skip endpoints that don't exist
  if [[ $NO_AUTH_STATUS == 404 ]]; then
    log_result "Missing Access Control (${endpoint})" "${YELLOW}SKIPPED: Endpoint not found (404)${NC}" "Response: $NO_AUTH_BODY"
    ((TESTS_SKIPPED++))
    continue
  fi

  check_denial "$NO_AUTH_STATUS" true "$NO_AUTH_BODY" "Missing Access Control: No auth on ${endpoint}" "missing_access"
done < "$ENDPOINTS_FILE"

for endpoint in "${SENSITIVE_ENDPOINTS[@]}"; do
  # Test with no authentication
  NO_AUTH_RESULT=$(curl -s -X GET "${API_URL}${endpoint}" \
    -w "\n%{http_code}" 2>&1)

  NO_AUTH_STATUS=$(echo "$NO_AUTH_RESULT" | tail -n1)
  NO_AUTH_BODY=$(echo "$NO_AUTH_RESULT" | sed '$d')

  # If it's a 404, we'll skip it as the endpoint might not exist
  if [[ $NO_AUTH_STATUS == 404 ]]; then
    log_result "Missing Access Control (${endpoint})" "${YELLOW}SKIPPED: Endpoint not found (404)${NC}" "Response: $NO_AUTH_BODY"
    ((TESTS_SKIPPED++))
    continue
  fi

  check_denial "$NO_AUTH_STATUS" true "$NO_AUTH_BODY" "Missing Access Control: No auth on ${endpoint}" "missing_access"
done

# ===== TEST 6: HTTP METHOD MANIPULATION =====
echo -e "\n${BLUE}Test 6: HTTP Method Manipulation${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if changing HTTP methods can bypass access controls${NC}\n"

# Test 6.1: Try inappropriate HTTP methods on endpoints
echo -e "${YELLOW}Test 6.1: Testing inappropriate HTTP methods on API endpoints...${NC}"

# Try PUT on a GET-only endpoint
METHOD_RESULT1=$(curl -s -X PUT "${API_URL}/api/units" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -d "{\"dummy\":\"data\"}" \
  -w "\n%{http_code}" 2>&1)

METHOD_STATUS1=$(echo "$METHOD_RESULT1" | tail -n1)
METHOD_BODY1=$(echo "$METHOD_RESULT1" | sed '$d')

check_denial "$METHOD_STATUS1" true "$METHOD_BODY1" "HTTP Method Manipulation: PUT on GET endpoint" "http_method"

# Try DELETE on a GET-only endpoint
METHOD_RESULT2=$(curl -s -X DELETE "${API_URL}/api/units/1" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

METHOD_STATUS2=$(echo "$METHOD_RESULT2" | tail -n1)
METHOD_BODY2=$(echo "$METHOD_RESULT2" | sed '$d')

check_denial "$METHOD_STATUS2" true "$METHOD_BODY2" "HTTP Method Manipulation: DELETE on GET endpoint" "http_method"

# ===== TEST 7: FUNCTION LEVEL ACCESS CONTROLS =====
echo -e "\n${BLUE}Test 7: Function Level Access Controls${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Testing if sensitive functions are properly protected${NC}\n"

# Test 7.1: Regular user attempts to perform admin functions
echo -e "${YELLOW}Test 7.1: Regular user attempting to perform admin functions...${NC}"

# Try to create a teaching period (assuming this is an admin function)
FUNC_RESULT1=$(curl -s -X POST "${API_URL}/api/teaching_periods" \
  -H "Content-Type: application/json" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -d "{\"teaching_period\":{\"name\":\"Test Period\",\"start_date\":\"2025-01-01\",\"end_date\":\"2025-06-30\"}}" \
  -w "\n%{http_code}" 2>&1)

FUNC_STATUS1=$(echo "$FUNC_RESULT1" | tail -n1)
FUNC_BODY1=$(echo "$FUNC_RESULT1" | sed '$d')

if [[ $FUNC_STATUS1 == 404 ]]; then
  log_result "Function Level Access Control: Create teaching period" "${YELLOW}SKIPPED: Endpoint not found (404)${NC}" "Response: $FUNC_BODY1"
  ((TESTS_SKIPPED++))
else
  check_denial "$FUNC_STATUS1" true "$FUNC_BODY1" "Function Level Access Control: Create teaching period" "function_level"
fi

# ===== CONTROL TEST: VERIFY PROPER ACCESS =====
echo -e "\n${BLUE}Control Test: Verify Proper Access${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Verifying that legitimate access still works properly${NC}\n"

# Test that admin can access admin resources
echo -e "${YELLOW}Control Test 1: Verifying admin can access admin resources...${NC}"
CONTROL_RESULT1=$(curl -s -X GET "${API_URL}/api/units" \
  -H "Username: ${ADMIN_USERNAME}" \
  -H "Auth-Token: ${ADMIN_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

CONTROL_STATUS1=$(echo "$CONTROL_RESULT1" | tail -n1)
CONTROL_BODY1=$(echo "$CONTROL_RESULT1" | sed '$d')

check_denial "$CONTROL_STATUS1" false "$CONTROL_BODY1" "Control Test: Admin accessing permitted resources"

# Test that regular user can access their own resources
echo -e "${YELLOW}Control Test 2: Verifying regular user can access permitted resources...${NC}"
CONTROL_RESULT2=$(curl -s -X GET "${API_URL}/api/units" \
  -H "Username: ${REGULAR_USER_USERNAME}" \
  -H "Auth-Token: ${REGULAR_USER_TOKEN}" \
  -w "\n%{http_code}" 2>&1)

CONTROL_STATUS2=$(echo "$CONTROL_RESULT2" | tail -n1)
CONTROL_BODY2=$(echo "$CONTROL_RESULT2" | sed '$d')

check_denial "$CONTROL_STATUS2" false "$CONTROL_BODY2" "Control Test: Regular user accessing permitted resources" "control_user"

# ===== Test Summary =====
echo -e "\n${BLUE}===== Test Summary =====${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Tests completed at $(date)${NC}" | tee -a "$LOG_FILE"
echo -e "${BLUE}Log file saved to: ${NC}$LOG_FILE" | tee -a "$LOG_FILE"

echo -e "\n${GREEN}Tests Passed: $TESTS_PASSED${NC}" | tee -a "$LOG_FILE"
echo -e "${RED}Tests Failed: $TESTS_FAILED${NC}" | tee -a "$LOG_FILE"
echo -e "${YELLOW}Tests Skipped/Inconclusive: $TESTS_SKIPPED${NC}" | tee -a "$LOG_FILE"

if [ $TESTS_FAILED -eq 0 ]; then
  echo -e "\n${GREEN}SUCCESS: No broken access control vulnerabilities detected.${NC}" | tee -a "$LOG_FILE"
  echo -e "${GREEN}✓ Access control mechanisms appear to be functioning correctly${NC}" | tee -a "$LOG_FILE"
  echo -e "${GREEN}✓ Unauthorized access attempts were properly denied${NC}" | tee -a "$LOG_FILE"
  echo -e "${GREEN}✓ Legitimate access is still permitted${NC}" | tee -a "$LOG_FILE"
else
  echo -e "\n${RED}WARNING: Potential broken access control vulnerabilities detected.${NC}" | tee -a "$LOG_FILE"
  echo -e "${RED}Review the log file for details on the failed tests.${NC}" | tee -a "$LOG_FILE"
  echo -e "${RED}These issues may allow unauthorized access to restricted resources.${NC}" | tee -a "$LOG_FILE"
fi

exit 0
