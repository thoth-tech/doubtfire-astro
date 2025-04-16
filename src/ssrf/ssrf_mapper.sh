#!/bin/bash

# SSRF Vulnerability Mapping & Testing Script
# This script scans an API for endpoints that accept URLs and tests for SSRF vulnerabilities.
# Author: Ibitope Fatoki, made with a lot of tears and blurry eyes

# Create log directory if it doesn't exist
LOG_DIR="ssrf_logs"
mkdir -p "$LOG_DIR"

# Check if required commands are available
if ! command -V curl &>/dev/null; then
  echo "curl could not be found. Please install it to run this script."
  exit 1
fi
if ! command -v jq &>/dev/null; then
  echo "jq could not be found. Please install from (https://github.com/stedolan/jq/releases) to run this script."
  exit 1
fi
if ! command -V grep &>/dev/null; then
  echo "grep could not be found. Please install it to run this script."
  exit 1
fi

# Prompt for target details from the user
read -p "Enter the target base URL (http://localhost): " TARGET_HOST                   # Base URL of the target
read -p "Enter the target port (4200): " TARGET_PORT                                   # Port to connect to
read -p "Enter path to API endpoints wordlist file (api_endpoints.txt): " API_WORDLIST # Path to the wordlist file containing API endpoints
read -p "Enter path to SSRF payloads wordlist file (payloads.txt): " PAYLOAD_WORDLIST  # Path to the wordlist file containing SSRF payloads
read -p "Enter max time per request (in seconds): " MAX_TIME                           # --max-time attribute for curl
read -p "Enter HTTP request method (GET or POST): " REQUEST_METHOD                     # HTTP request method

# Check if the provided files exist
if [ ! -f "$API_WORDLIST" ]; then
  echo "API wordlist file not found: $API_WORDLIST"
  exit 1
fi
if [ ! -f "$PAYLOAD_WORDLIST" ]; then
  echo "Payload wordlist file not found: $PAYLOAD_WORDLIST"
  exit 1
fi

# Check if the target host is reachable
if ! curl -s --head --max-time 5 "$TARGET_HOST:$TARGET_PORT" >/dev/null; then
  echo "Target host is not reachable: $TARGET_HOST:$TARGET_PORT"
  exit 1
fi

# Check if the request method is valid
if [[ "$REQUEST_METHOD" != "GET" && "$REQUEST_METHOD" != "POST" ]]; then
  echo "Invalid request method: $REQUEST_METHOD. Use GET or POST."
  exit 1
fi

# Check if the max time is a valid number
if ! [[ "$MAX_TIME" =~ ^[0-9]+$ ]]; then
  echo "Invalid max time: $MAX_TIME. Please enter a valid number."
  exit 1
fi

# Check if the API wordlist file is empty
if [ ! -s "$API_WORDLIST" ]; then
  echo "API wordlist file is empty: $API_WORDLIST"
  exit 1
fi
# Check if the payload wordlist file is empty
if [ ! -s "$PAYLOAD_WORDLIST" ]; then
  echo "Payload wordlist file is empty: $PAYLOAD_WORDLIST"
  exit 1
fi

# Logfile setup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
RESULT_LOG="$LOG_DIR/ssrf_test_results_${TIMESTAMP}.md"
SLOW_LOG="$LOG_DIR/slow_endpoints_${TIMESTAMP}.md"

echo "# SSRF Test Results" >"$RESULT_LOG"
echo "**Scan started on $(date)**" >>"$RESULT_LOG"
echo "**Target: $TARGET_HOST:$TARGET_PORT**" >>"$RESULT_LOG"
echo "**Request Method: $REQUEST_METHOD**" >>"$RESULT_LOG"
echo "**Max Time: $MAX_TIME seconds**" >>"$RESULT_LOG"
echo "**API Wordlist: $API_WORDLIST**" >>"$RESULT_LOG"
echo "**Payload Wordlist: $PAYLOAD_WORDLIST**" >>"$RESULT_LOG"
echo >>"$RESULT_LOG"

echo "# Slow or Unresponsive Endpoints" >"$SLOW_LOG"
echo "**Logged on $(date)**" >>"$SLOW_LOG"
echo "**Target: $TARGET_HOST:$TARGET_PORT**" >>"$SLOW_LOG"
echo "**Request Method: $REQUEST_METHOD**" >>"$SLOW_LOG"
echo "**Max Time: $MAX_TIME seconds**" >>"$SLOW_LOG"
echo "**API Wordlist: $API_WORDLIST**" >>"$SLOW_LOG"
echo "**Payload Wordlist: $PAYLOAD_WORDLIST**" >>"$SLOW_LOG"
echo >>"$SLOW_LOG"

# Color codes
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# Output counters
ssrf_hits=0
slow_count=0

# Logging functions
echo_and_log() {
  local clean_text
  clean_text=$(echo -e "$1" | sed 's/\x1B\[[0-9;]*[JKmsu]//g')
  echo -e "$1"
  echo "$clean_text" >>"$RESULT_LOG"
}

log_slow() {
  local clean_text
  clean_text=$(echo -e "$1" | sed 's/\x1B\[[0-9;]*[JKmsu]//g')
  echo "$clean_text" >>"$SLOW_LOG"
}

# Intro Banner
echo_and_log "${YELLOW}"
echo_and_log "========================================================"
echo_and_log "        😎 SSRF Mapping & Testing Script 😎            "
echo_and_log "     Made with tears and possibly love by Ibi           "
echo_and_log "========================================================"
echo_and_log "${NC}"

# Test function
test_endpoint() {
  local endpoint="$1"
  local full_url="${TARGET_HOST}:${TARGET_PORT}${endpoint}"
  echo_and_log "${YELLOW}## Testing endpoint: $full_url${NC}"

  while IFS= read -r payload || [[ -n "$payload" ]]; do
    encoded_payload=$(printf "%s" "$payload" | jq -sRr @uri)
    test_url="${full_url}?url=${encoded_payload}"
    echo_and_log "- Testing: \`$test_url\`"

    if [ "$REQUEST_METHOD" == "POST" ]; then
      response_code=$(curl --max-time "$MAX_TIME" -s -o /dev/null -w "%{http_code}" -X POST --data "url=${encoded_payload}" "$full_url")
      curl_exit=$?
      if [[ $curl_exit -eq 28 ]]; then
        log_slow "- **[SLOW] Timeout:** \`$test_url\`"
        slow_count=$((slow_count + 1))
      elif [[ "$response_code" =~ 200|302 ]]; then
        echo_and_log "${RED} ⚠️ - **Possible SSRF vulnerability at:** \`$test_url\` _(POST)_${NC}"
        ssrf_hits=$((ssrf_hits + 1))
      fi
    else
      response_body=$(curl --max-time "$MAX_TIME" -s "$test_url")
      curl_exit=$?
      if [[ $curl_exit -eq 28 ]]; then
        log_slow "- **[SLOW] Timeout:** \`$test_url\`"
        slow_count=$((slow_count + 1))
      elif echo "$response_body" | grep -Ei "metadata|localhost|internal|root:x:0:0" >/dev/null; then
        echo_and_log "${RED} ⚠️  - **Possible SSRF vulnerability at:** \`$test_url\` _(GET response leak)_${NC}"
        ssrf_hits=$((ssrf_hits + 1))
      fi
    fi
  done <"$PAYLOAD_WORDLIST"
}

# Start scan
echo_and_log "${GREEN} 🚀 #Starting SSRF testing for $TARGET_HOST:$TARGET_PORT${NC}"
while IFS= read -r endpoint || [[ -n "$endpoint" ]]; do
  test_endpoint "$endpoint"
done <"$API_WORDLIST"

# Summary
echo_and_log "\n${GREEN} #Test Summary${NC}"
echo_and_log "${YELLOW}- Total endpoints tested:${NC} $(wc -l <"$API_WORDLIST")"
echo_and_log "${YELLOW}- Total payloads sent per endpoint:${NC} $(wc -l <"$PAYLOAD_WORDLIST")"
echo_and_log "${RED}- SSRF hits:${NC} $ssrf_hits"
echo_and_log "${YELLOW}- Slow/Unresponsive requests:${NC} $slow_count"
echo_and_log "\n${GREEN}# SSRF testing completed.${NC}"
echo -e "${YELLOW}Slow and/or unresponsive endpoints are listed in:${NC} $SLOW_LOG"
