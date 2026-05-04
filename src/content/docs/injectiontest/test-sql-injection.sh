#!/bin/bash
# Thoth Tech Security Suite: SQL Injection Validator
# Supporting T1 2026 Objective: Security and Vulnerability Remediation

# Load configuration from config file if it exists
CONFIG_FILE="./sql_injection_config.sh"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
    printf "Loaded configuration from $CONFIG_FILE\n"
fi

# Set variables with defaults
API_URL="${API_URL:-http://localhost:3000}"
TARGET_URL="${API_URL}/api/auth"
USERNAME_FIELD="username"
PASSWORD_FIELD="password"

# Colours for output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Colour

# Professional SQL injection payloads for deep testing
declare -a PAYLOADS=(
  "' OR '1'='1"                          # Auth Bypass
  "admin' --"                            # Admin account targeting
  "' UNION SELECT NULL,NULL,NULL --"     # Data structure probing
  "'; WAITFOR DELAY '0:0:5'--"           # Blind/Time-based testing
  "admin' AND 1=1#"                      # Boolean logic bypass
)

printf "${BLUE}==================================================${NC}\n"
printf "${BLUE}   THOTH TECH: SQL INJECTION SECURITY SCANNER     ${NC}\n"
printf "${BLUE}==================================================${NC}\n"

# 1. Verify API Connectivity
printf "Probing API status at ${API_URL}... "
if ! curl -s --head --request GET "$API_URL" | grep -q "200\|301\|302"; then
    printf "${RED}OFFLINE${NC}\n"
    printf "${YELLOW}WARNING: Testing against an offline API will yield false negatives.${NC}\n"
else
    printf "${GREEN}ONLINE${NC}\n"
fi

# 2. Injection Test Function
test_injection() {
  local payload=$1
  local field=$2
  
  printf "Testing ${field} field with: [ ${payload} ] -> "

  # Execute the POST request
  local response=$(curl -s -X POST "$TARGET_URL" \
    -H "Content-Type: application/json" \
    -d "{\"$USERNAME_FIELD\":\"$( [[ "$field" == "user" ]] && echo "$payload" || echo "student_1" )\", \"$PASSWORD_FIELD\":\"$( [[ "$field" == "pass" ]] && echo "$payload" || echo "password" )\"}" \
    -w "\n%{http_code}")

  local status=$(echo "$response" | tail -n1)
  local body=$(echo "$response" | sed '$d')

  # Evaluate vulnerability status
  if [[ "$status" == "200" || "$status" == "201" ]]; then
    # In a secure API, a payload should NOT return an auth token
    if [[ "$body" == *"token"* || "$body" == *"auth_token"* || "$body" == *"user"* ]]; then
        printf "${RED}VULNERABLE (Auth Bypass Possible)${NC}\n"
        return 1
    fi
  elif [[ "$status" == "500" ]]; then
    printf "${YELLOW}POTENTIAL LEAK (Internal Server Error)${NC}\n"
    return 2
  else
    printf "${GREEN}SECURE (Status $status)${NC}\n"
    return 0
  fi
}

# 3. Main Testing Suite
printf "\n${BLUE}--- Starting SQLi Test Suite ---${NC}\n"
vulns_found=0

for p in "${PAYLOADS[@]}"; do
  test_injection "$p" "user"
  [[ $? -eq 1 ]] && ((vulns_found++))
done

# 4. Final Assessment
printf "\n${BLUE}==================================================${NC}\n"
if [ $vulns_found -eq 0 ]; then
    printf "${GREEN}SUMMARY: No critical vulnerabilities detected.${NC}\n"
else
    printf "${RED}SUMMARY: $vulns_found vulnerabilities detected! Immediate remediation required.${NC}\n"
fi
printf "${BLUE}==================================================${NC}\n"