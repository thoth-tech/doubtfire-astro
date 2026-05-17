#!/bin/bash
# Thoth Tech Security Suite: SQL Injection Validator (V2.0)
# Addresses feedback: Restored CLI options, Nikto, and multi-field testing.

# 1. Variables & Configuration
CONFIG_FILE="./sql_injection_config.sh"
[ -f "$CONFIG_FILE" ] && source "$CONFIG_FILE"

API_URL="${API_URL:-http://localhost:3000}"
USERNAME_FIELD="${USERNAME_FIELD:-username}"
PASSWORD_FIELD="${PASSWORD_FIELD:-password}"
TARGET_URL="${API_URL}/api/auth"

# 2. CLI Options (Restored)
show_usage() {
  printf "Usage: $0 [-a API_URL] [-u USER_FIELD] [-p PASS_FIELD]\n"
  exit 1
}

while getopts "a:u:p:h" opt; do
  case ${opt} in
    a ) API_URL=$OPTARG; TARGET_URL="${API_URL}/api/auth" ;;
    u ) USERNAME_FIELD=$OPTARG ;;
    p ) PASSWORD_FIELD=$OPTARG ;;
    h | \? ) show_usage ;;
  esac
done

# 3. Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; BLUE='\033[0;34m'; NC='\033[0m'

# 4. Advanced Detection Logic (Addressing False Positives)
# Instead of just 'user', we look for status 200/201 AND a token-like string
check_vulnerability() {
  local status=$1
  local body=$2
  
  if [[ "$status" =~ ^20[0-1]$ ]]; then
    # Improved check: looks for "token" or "auth_token" specifically
    if [[ "$body" =~ "token" ]] || [[ "$body" =~ "auth_token" ]]; then
      return 1 # VULNERABLE
    fi
  fi
  return 0 # SECURE
}

# 5. Testing Logic (Restored both fields)
run_test() {
  local payload=$1
  local field_to_test=$2
  printf "${BLUE}Testing $field_to_test with:${NC} $payload -> "

  local response=$(curl -s --connect-timeout 5 -X POST "$TARGET_URL" \
    -H "Content-Type: application/json" \
    -d "$( [[ "$field_to_test" == "username" ]] && \
           echo "{\"$USERNAME_FIELD\":\"$payload\", \"$PASSWORD_FIELD\":\"pass\"}" || \
           echo "{\"$USERNAME_FIELD\":\"user\", \"$PASSWORD_FIELD\":\"$payload\"}" )" \
    -w "\n%{http_code}")

  local code=$(echo "$response" | tail -n1)
  local body=$(echo "$response" | sed '$d')

  if check_vulnerability "$code" "$body"; then
    printf "${GREEN}BLOCKED ($code)${NC}\n"
  else
    printf "${RED}VULNERABLE (Token Leaked)${NC}\n"
    return 1
  fi
}

# 6. Execution Loop (Both Fields)
declare -a PAYLOADS=("' OR '1'='1" "admin' --" "') UNION SELECT 1,2,3--")
vuln_count=0

for p in "${PAYLOADS[@]}"; do
  run_test "$p" "username" || ((vuln_count++))
  run_test "$p" "password" || ((vuln_count++))
done

# 7. Nikto Integration (Restored)
printf "\n${BLUE}===== Running Nikto Audit =====${NC}\n"
if command -v nikto &> /dev/null; then
  nikto -host "$API_URL" -Format txt -output nikto_results.txt
  printf "${GREEN}Scan complete. See nikto_results.txt${NC}\n"
else
  printf "${RED}Nikto not found. Skipping scan.${NC}\n"
fi

exit $vuln_count