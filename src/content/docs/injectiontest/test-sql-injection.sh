#!/bin/bash
# Improved SQL Injection Security Test Script
# This script tests the application's resistance to SQL injection attacks

# Load configuration from config file if it exists
CONFIG_FILE="./sql_injection_config.sh"
if [ -f "$CONFIG_FILE" ]; then
  # Source the config file to get custom configuration
  source "$CONFIG_FILE"
  printf "Loaded configuration from $CONFIG_FILE\n"
fi

# Set variables with config file values or defaults
API_URL="${API_URL:-http://localhost:3000}"
CLIENT_URL="${CLIENT_URL:-http://localhost:4200}"
USERNAME_FIELD="${USERNAME_FIELD:-username}"
PASSWORD_FIELD="${PASSWORD_FIELD:-password}"
STUDENT_USERNAME="${STUDENT_USERNAME:-student_1}"
STUDENT_PASSWORD="${STUDENT_PASSWORD:-password}"
ADMIN_USERNAME="${ADMIN_USERNAME:-aadmin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-password}"

# Derive dependent URLs
CLIENT_LOGIN_PAGE="${CLIENT_URL}/#/sign_in"
TARGET_URL="${API_URL}/api/auth"
NIKTO_TARGET="$API_URL"

# Script usage function
show_usage() {
  printf "Usage: $0 [options]\n"
  printf "Options:\n"
  printf "  -a URL   Set API URL (default: http://localhost:3000)\n"
  printf "  -c URL   Set client URL (default: http://localhost:4200)\n"
  printf "  -u USER  Set student username for testing (default: student_1)\n"
  printf "  -p PASS  Set student password for testing (default: password)\n"
  printf "  -h       Show this help message\n"
  printf "\nYou can also create a config file named 'sql_injection_config.sh' with values for API_URL, CLIENT_URL, etc.\n"
  exit 1
}

# Parse command line options (these override both defaults and config file)
while getopts "a:c:u:p:h" opt; do
  case ${opt} in
    a )
      API_URL=$OPTARG
      NIKTO_TARGET=$OPTARG
      TARGET_URL="${API_URL}/api/auth"
      ;;
    c )
      CLIENT_URL=$OPTARG
      CLIENT_LOGIN_PAGE="${CLIENT_URL}/#/sign_in"
      ;;
    u )
      STUDENT_USERNAME=$OPTARG
      ;;
    p )
      STUDENT_PASSWORD=$OPTARG
      ;;
    h )
      show_usage
      ;;
    \? )
      show_usage
      ;;
  esac
done

# Display configuration
printf "Using configuration:\n"
printf "  API URL: $API_URL\n"
printf "  Client URL: $CLIENT_URL\n"
printf "  Target endpoint: $TARGET_URL\n"

# Colors for output - we'll use these without echo -e to avoid the -e in output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# SQL injection payloads to test
declare -a PAYLOADS=(
  "' OR '1'='1"
  "admin' --"
  "' OR 1=1 --"
  "' UNION SELECT username, password FROM users --"
  "' OR '1'='1'; DROP TABLE users; --"
  "admin'; SELECT * FROM users; --"
)

printf "${BLUE}===== SQL Injection Security Test =====${NC}\n"
printf "${BLUE}This test will verify that the application is protected against SQL injection attacks.${NC}\n"
printf "${BLUE}Testing API endpoint: ${TARGET_URL} (Client login page: ${CLIENT_LOGIN_PAGE})${NC}\n"
printf "${BLUE}Expected result: All injection attempts should be blocked.${NC}\n\n"

# Verify legitimate credentials first
printf "\n${BLUE}===== Verifying Legitimate Credentials =====${NC}\n"
printf "${BLUE}Testing valid login with student credentials${NC}\n"

# Add timeout and hardcode the URL to avoid parsing issues
VALID_LOGIN_RESULT=$(curl -s --connect-timeout 10 -X POST "$TARGET_URL" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"$STUDENT_USERNAME\", \"password\":\"$STUDENT_PASSWORD\"}" \
  -w "\n%{http_code}" 2>&1)

VALID_LOGIN_STATUS=$(echo "$VALID_LOGIN_RESULT" | tail -n1)
VALID_LOGIN_BODY=$(echo "$VALID_LOGIN_RESULT" | sed '$d')

printf "${BLUE}Connection details:${NC}\n"
echo "$VALID_LOGIN_RESULT" | grep -E "Connected to|Connection refused|Failed to connect" || echo "No connection details found"

if [[ "$VALID_LOGIN_STATUS" == "200" || "$VALID_LOGIN_STATUS" == "201" ]] && [[ "$VALID_LOGIN_BODY" == *"auth_token"* || "$VALID_LOGIN_BODY" == *"user"* ]]; then
  printf "${GREEN}✓ Valid credentials work correctly${NC}\n"
  if [[ "$VALID_LOGIN_BODY" == *"auth_token"* ]]; then
    printf "${GREEN}  Received authentication token.${NC}\n"
  elif [[ "$VALID_LOGIN_BODY" == *"user"* ]]; then
    printf "${GREEN}  Received user data.${NC}\n"
  fi
  VALID_LOGIN_TEST="PASSED"
else
  printf "${RED}✗ Valid credentials test failed. Check if the API is running correctly.${NC}\n"
  printf "${YELLOW}  Status: $VALID_LOGIN_STATUS${NC}\n"
  printf "${YELLOW}  Response snippet: ${VALID_LOGIN_BODY:0:100}${NC}\n"
  printf "${YELLOW}  Try manually checking if the API is running with: curl $TARGET_URL${NC}\n"
  VALID_LOGIN_TEST="FAILED"
  printf "${YELLOW}WARNING: The SQL injection tests may not be reliable if valid login doesn't work.${NC}\n"

  # Ask if user wants to continue despite the failed credentials test
  printf "${BLUE}Do you want to continue with SQL injection tests anyway? (y/n)${NC}\n"
  read -r continue_choice
  if [[ ! "$continue_choice" =~ ^[Yy]$ ]]; then
    printf "${BLUE}Test aborted. Please ensure the API is running and try again.${NC}\n"
    exit 1
  fi
fi

printf "${BLUE}----------------------------------------${NC}\n\n"

# Function to test a single payload
test_payload() {
  local payload=$1
  local field=$2
  local endpoint=$3

  printf "${BLUE}Testing payload: ${payload} in ${field} field${NC}\n"

  local response
  if [ "$field" == "$USERNAME_FIELD" ]; then
    response=$(curl -s --connect-timeout 5 -X POST "$endpoint" \
      -H "Content-Type: application/json" \
      -d "{\"$USERNAME_FIELD\":\"${payload}\", \"$PASSWORD_FIELD\":\"$STUDENT_PASSWORD\"}" \
      -w "\n%{http_code}" 2>&1)
  else
    response=$(curl -s --connect-timeout 5 -X POST "$endpoint" \
      -H "Content-Type: application/json" \
      -d "{\"$USERNAME_FIELD\":\"$STUDENT_USERNAME\", \"$PASSWORD_FIELD\":\"${payload}\"}" \
      -w "\n%{http_code}" 2>&1)
  fi

  local status_code=$(echo "$response" | tail -n1)
  local body=$(echo "$response" | sed '$d')

  printf "${BLUE}Status code: ${status_code}${NC}\n"

  if [[ "$status_code" == "200" && "$body" == *"success"* || "$body" == *"token"* || "$body" == *"welcome"* ]]; then
    printf "${RED}✗ VULNERABILITY DETECTED: Injection may have succeeded!${NC}\n"
    printf "${RED}   Response indicates successful login or data retrieval.${NC}\n"
    return 1
  elif [[ "$body" == *"error"* || "$body" == *"invalid"* || "$body" == *"sql"* || "$body" == *"syntax"* ]]; then
    printf "${GREEN}✓ Injection blocked: Error message detected${NC}\n"
    return 0
  elif [[ "$status_code" == "400" || "$status_code" == "401" || "$status_code" == "403" || "$status_code" == "422" ]]; then
    printf "${GREEN}✓ Injection blocked: Appropriate error status code returned${NC}\n"
    return 0
  else
    printf "${YELLOW}? Inconclusive: Unexpected response${NC}\n"
    printf "${YELLOW}  Response body: ${body}${NC}\n"
    return 2
  fi
}

# Test username field
printf "\n${BLUE}===== Testing Username Field =====${NC}\n"
username_passed=0
username_failed=0
username_inconclusive=0

for payload in "${PAYLOADS[@]}"; do
  test_payload "$payload" "$USERNAME_FIELD" "$TARGET_URL"
  test_result=$?

  if [ $test_result -eq 0 ]; then
    ((username_passed++))
  elif [ $test_result -eq 1 ]; then
    ((username_failed++))
  else
    ((username_inconclusive++))
  fi

  printf "${BLUE}----------------------------------------${NC}\n\n"
done

# Test password field
printf "\n${BLUE}===== Testing Password Field =====${NC}\n"
password_passed=0
password_failed=0
password_inconclusive=0

for payload in "${PAYLOADS[@]}"; do
  test_payload "$payload" "$PASSWORD_FIELD" "$TARGET_URL"
  test_result=$?

  if [ $test_result -eq 0 ]; then
    ((password_passed++))
  elif [ $test_result -eq 1 ]; then
    ((password_failed++))
  else
    ((password_inconclusive++))
  fi

  printf "${BLUE}----------------------------------------${NC}\n\n"
done

printf "\n${BLUE}===== Running Nikto Scan for Input Validation Issues =====${NC}\n"
printf "${BLUE}This may take a few minutes...${NC}\n"
if command -v nikto &> /dev/null; then
  printf "${BLUE}Starting Nikto scan...${NC}\n"
  nikto -host "$NIKTO_TARGET" -Format txt -output nikto_scan_output.txt
  printf "${GREEN}Nikto scan complete. Results saved to 'nikto_scan_output.txt'${NC}\n"

  # Check for SQL injection vulnerabilities in Nikto output
  if grep -q "SQL Injection" nikto_scan_output.txt; then
    printf "${RED}⚠️ Nikto found potential SQL Injection vulnerabilities!${NC}\n"
    printf "${RED}Please review the full report in nikto_scan_output.txt${NC}\n"
    nikto_sql_detected=true
  else
    printf "${GREEN}✓ No SQL Injection vulnerabilities detected by Nikto${NC}\n"
    nikto_sql_detected=false
  fi
else
  printf "${YELLOW}Nikto not installed. Skipping automated vulnerability scan.${NC}\n"
  printf "${YELLOW}Install Nikto with: sudo apt-get install nikto (Debian/Ubuntu)${NC}\n"
  nikto_sql_detected=false
fi

# Summarize results
printf "\n${BLUE}===== Test Summary =====${NC}\n"
printf "${BLUE}Username field tests:${NC}\n"
printf "  ${GREEN}✓ Passed: $username_passed${NC}\n"
printf "  ${RED}✗ Failed: $username_failed${NC}\n"
printf "  ${YELLOW}? Inconclusive: $username_inconclusive${NC}\n"

printf "\n${BLUE}Password field tests:${NC}\n"
printf "  ${GREEN}✓ Passed: $password_passed${NC}\n"
printf "  ${RED}✗ Failed: $password_failed${NC}\n"
printf "  ${YELLOW}? Inconclusive: $password_inconclusive${NC}\n"

printf "\n${BLUE}Nikto scan:${NC}\n"
if [ "$nikto_sql_detected" = true ]; then
  printf "  ${RED}✗ SQL vulnerabilities detected${NC}\n"
else
  printf "  ${GREEN}✓ No SQL vulnerabilities detected${NC}\n"
fi

printf "\n${BLUE}Valid credentials test:${NC}\n"
if [ "$VALID_LOGIN_TEST" = "PASSED" ]; then
  printf "  ${GREEN}✓ Valid login works${NC}\n"
else
  printf "  ${RED}✗ Valid login failed${NC}\n"
fi

# Final assessment
TOTAL_FAILED=$((username_failed + password_failed))
NIKTO_FAILED=$([[ "$nikto_sql_detected" = true ]] && echo 1 || echo 0)

if [[ $TOTAL_FAILED -eq 0 && $NIKTO_FAILED -eq 0 ]]; then
  printf "\n${GREEN}SUCCESS: Your application appears to be protected against SQL injection attacks.${NC}\n"
  printf "${GREEN}✓ All manual injection tests passed${NC}\n"
  printf "${GREEN}✓ No SQL injection vulnerabilities detected by Nikto${NC}\n"
elif [[ $TOTAL_FAILED -eq 0 && $NIKTO_FAILED -eq 1 ]]; then
  printf "\n${YELLOW}PARTIAL SUCCESS: Manual tests passed but Nikto found potential issues.${NC}\n"
  printf "${YELLOW}Please review the Nikto report for details.${NC}\n"
else
  printf "\n${RED}VULNERABILITY DETECTED: Your application may be vulnerable to SQL injection!${NC}\n"
  printf "${RED}Please review failed tests and fix the identified vulnerabilities.${NC}\n"
fi

exit 0
