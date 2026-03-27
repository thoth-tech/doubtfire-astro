#!/bin/bash

# Cryptographic Security Audit Script
# Tests encryption practices, TLS configuration, and sensitive data handling
# macOS Compatible Version - Fixed timeout issues

set -e

# Enable debug mode if DEBUG=1
if [ "${DEBUG:-0}" = "1" ]; then
    set -x
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TARGET_URL=""
TARGET_HOST=""
TARGET_PORT="443"
LOG_DIR="./crypto_audit_logs"
RESULTS_FILE="$LOG_DIR/crypto_audit_results.txt"

# Function to print colored output
print_status() {
    local color=$1
    local message=$2
    echo -e "${color}[$(date '+%Y-%m-%d %H:%M:%S')] ${message}${NC}"
}

print_header() {
    echo -e "\n${BLUE}================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================================${NC}\n"
}

# macOS compatible timeout function
run_with_timeout() {
    local timeout_duration=$1
    local command=$2
    
    # Check if GNU timeout is available (from coreutils)
    if command -v gtimeout &> /dev/null; then
        gtimeout "$timeout_duration" bash -c "$command"
    elif command -v timeout &> /dev/null; then
        timeout "$timeout_duration" bash -c "$command"
    else
        # Fallback: use Perl for timeout (available on macOS by default)
        perl -e "
            alarm($timeout_duration);
            \$SIG{ALRM} = sub { exit 124 };
            system('$command');
        " 2>/dev/null
    fi
}

# Function to check if required tools are installed
check_dependencies() {
    print_header "CHECKING DEPENDENCIES"
    
    local required_tools=("curl" "openssl" "grep" "awk" "sed")
    local optional_tools=("nmap" "testssl" "nc")
    local missing_required=()
    local missing_optional=()
    
    # Check required tools
    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            missing_required+=("$tool")
        else
            print_status "$GREEN" "✓ $tool is installed"
        fi
    done
    
    # Check optional tools
    for tool in "${optional_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            # Special check for testssl.sh in common locations
            if [ "$tool" = "testssl" ]; then
                if [ -f "./testssl.sh/testssl.sh" ] || [ -f "../testssl.sh/testssl.sh" ] || [ -f "~/testssl.sh/testssl.sh" ]; then
                    print_status "$GREEN" "✓ testssl.sh found locally"
                    continue
                fi
            fi
            missing_optional+=("$tool")
            print_status "$YELLOW" "⚠ $tool is missing (optional - some features limited)"
        else
            print_status "$GREEN" "✓ $tool is installed"
        fi
    done
    
    if [ ${#missing_required[@]} -ne 0 ]; then
        print_status "$RED" "Missing required tools: ${missing_required[*]}"
        echo -e "\nInstall missing tools:"
        echo "macOS: brew install ${missing_required[*]}"
        echo "Ubuntu/Debian: sudo apt-get install ${missing_required[*]}"
        exit 1
    fi
    
    if [ ${#missing_optional[@]} -ne 0 ]; then
        print_status "$YELLOW" "Missing optional tools: ${missing_optional[*]}"
        echo -e "For enhanced testing, install:"
        echo "macOS: brew install nmap coreutils"
        echo "testssl.sh: git clone https://github.com/drwetter/testssl.sh.git"
        echo -e "\nContinuing with basic tests...\n"
        sleep 2
    fi
    
    # Check for timeout alternatives
    if command -v gtimeout &> /dev/null; then
        print_status "$GREEN" "✓ GNU timeout (gtimeout) available"
    elif command -v timeout &> /dev/null; then
        print_status "$GREEN" "✓ timeout command available"
    else
        print_status "$YELLOW" "⚠ Using Perl-based timeout fallback"
    fi
}

# Function to setup directories and files
setup_environment() {
    print_header "SETTING UP ENVIRONMENT"
    
    mkdir -p "$LOG_DIR"
    echo "Cryptographic Security Audit Report" > "$RESULTS_FILE"
    echo "Generated on: $(date)" >> "$RESULTS_FILE"
    echo "Target: $TARGET_URL" >> "$RESULTS_FILE"
    echo "========================================" >> "$RESULTS_FILE"
    
    print_status "$GREEN" "✓ Environment setup complete"
}

# Test 1: AES-256 Encryption and Key Management
test_encryption_practices() {
    print_header "TEST 1: ENCRYPTION PRACTICES (AES-256 & KEY MANAGEMENT)"
    
    echo -e "\n=== ENCRYPTION PRACTICES TEST ===" >> "$RESULTS_FILE"
    
    # Check for encryption indicators in HTTP headers
    print_status "$YELLOW" "Checking HTTP headers for encryption indicators..."
    
    if [ -n "$TARGET_URL" ]; then
        # Try HTTPS first, then fallback to HTTP for localhost
        if curl -I -s -k --connect-timeout 10 "$TARGET_URL" > "$LOG_DIR/headers.txt" 2>&1; then
            print_status "$GREEN" "✓ Successfully connected to $TARGET_URL"
        elif [ "$(echo "$TARGET_URL" | grep -o "localhost\|127.0.0.1")" ]; then
            # Try HTTP for localhost if HTTPS fails
            HTTP_URL=$(echo "$TARGET_URL" | sed 's/https:/http:/')
            print_status "$YELLOW" "HTTPS failed, trying HTTP for localhost: $HTTP_URL"
            if curl -I -s --connect-timeout 10 "$HTTP_URL" > "$LOG_DIR/headers.txt" 2>&1; then
                print_status "$YELLOW" "⚠ Connected via HTTP (not HTTPS) - security risk for production"
                echo "WARN: Application running on HTTP instead of HTTPS" >> "$RESULTS_FILE"
            else
                print_status "$RED" "✗ Cannot connect to application"
                echo "FAIL: Cannot connect to target application" >> "$RESULTS_FILE"
                return
            fi
        else
            print_status "$RED" "✗ Cannot connect to $TARGET_URL"
            echo "FAIL: Cannot connect to target application" >> "$RESULTS_FILE"
            return
        fi
        
        # Check for security headers that might indicate encryption usage
        if grep -qi "strict-transport-security\|content-security-policy\|x-frame-options" "$LOG_DIR/headers.txt"; then
            print_status "$GREEN" "✓ Security headers present (indicates security awareness)"
            echo "PASS: Security headers found" >> "$RESULTS_FILE"
        else
            print_status "$RED" "✗ Limited security headers found"
            echo "WARN: Limited security headers" >> "$RESULTS_FILE"
        fi
    fi
    
    # Check for common encryption patterns in application
    print_status "$YELLOW" "Checking for encryption implementation patterns..."
    
    # Look for AES encryption patterns in common locations
    local search_dirs=("." "src" "app" "config" "lib")
    local found_encryption=false
    
    for dir in "${search_dirs[@]}"; do
        if [ -d "$dir" ]; then
            # Search for AES-256 references
            if grep -r -i "aes.256\|aes256\|rijndael" "$dir" --include="*.js" --include="*.py" --include="*.rb" --include="*.php" --include="*.java" --include="*.cs" 2>/dev/null | head -5; then
                found_encryption=true
                print_status "$GREEN" "✓ Found AES-256 encryption references in $dir"
            fi
            
            # Search for key management patterns
            if grep -r -i "crypto\|cipher\|encrypt\|decrypt\|keystore\|secret.key" "$dir" --include="*.js" --include="*.py" --include="*.rb" --include="*.php" --include="*.java" --include="*.cs" 2>/dev/null | head -3; then
                print_status "$YELLOW" "⚠ Found cryptographic operations in $dir"
            fi
        fi
    done
    
    if [ "$found_encryption" = true ]; then
        echo "PASS: AES-256 encryption references found" >> "$RESULTS_FILE"
    else
        echo "WARN: No explicit AES-256 encryption found" >> "$RESULTS_FILE"
    fi
    
    # Check for hardcoded keys (security risk)
    print_status "$YELLOW" "Scanning for hardcoded secrets..."
    
    local hardcoded_found=false
    for dir in "${search_dirs[@]}"; do
        if [ -d "$dir" ]; then
            if grep -r -i "password\s*=\|api.key\s*=\|secret\s*=\|token\s*=" "$dir" --include="*.js" --include="*.py" --include="*.rb" --include="*.php" --include="*.java" --include="*.cs" --include="*.json" --include="*.yaml" --include="*.yml" 2>/dev/null | grep -v "example\|sample\|test" | head -3; then
                hardcoded_found=true
                print_status "$RED" "✗ Potential hardcoded secrets found in $dir"
            fi
        fi
    done
    
    if [ "$hardcoded_found" = true ]; then
        echo "FAIL: Hardcoded secrets detected" >> "$RESULTS_FILE"
    else
        echo "PASS: No obvious hardcoded secrets found" >> "$RESULTS_FILE"
    fi
}

# Test 2: SSL/TLS Configuration - Fixed for macOS
test_tls_configuration() {
    print_header "TEST 2: SSL/TLS CONFIGURATION"
    
    if [ -z "$TARGET_HOST" ]; then
        print_status "$RED" "✗ No target host specified for TLS testing"
        echo "SKIP: TLS test - no target host" >> "$RESULTS_FILE"
        return
    fi
    
    echo -e "\n=== TLS CONFIGURATION TEST ===" >> "$RESULTS_FILE"
    
    print_status "$YELLOW" "Testing TLS configuration for $TARGET_HOST:$TARGET_PORT..."
    
    # Check if the port is open and responding (with better macOS compatibility)
    local port_open=false
    if command -v nc &> /dev/null; then
        if nc -z "$TARGET_HOST" "$TARGET_PORT" 2>/dev/null; then
            port_open=true
        fi
    else
        # Fallback using bash TCP test
        if bash -c "echo >/dev/tcp/$TARGET_HOST/$TARGET_PORT" 2>/dev/null; then
            port_open=true
        fi
    fi
    
    if [ "$port_open" = false ]; then
        print_status "$RED" "✗ Cannot connect to $TARGET_HOST:$TARGET_PORT (port closed or filtered)"
        echo "FAIL: Port $TARGET_PORT not accessible" >> "$RESULTS_FILE"
        return
    fi
    
    print_status "$GREEN" "✓ Port $TARGET_PORT is accessible"
    
    # Basic OpenSSL TLS test with macOS-compatible timeout
    print_status "$YELLOW" "Checking TLS versions and ciphers..."
    
    # Test TLS 1.3 with timeout handling
    local tls13_result=""
    if run_with_timeout 10 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -tls1_3 2>/dev/null | grep -q 'Verify return code: 0'"; then
        print_status "$GREEN" "✓ TLS 1.3 supported with valid certificate"
        echo "PASS: TLS 1.3 supported" >> "$RESULTS_FILE"
    elif run_with_timeout 10 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -tls1_3 2>&1 | grep -q 'BEGIN CERTIFICATE'"; then
        print_status "$YELLOW" "⚠ TLS 1.3 connection established but certificate verification failed (common for localhost)"
        echo "WARN: TLS 1.3 connected but cert verification failed" >> "$RESULTS_FILE"
    else
        print_status "$YELLOW" "⚠ TLS 1.3 not detected or connection failed"
        echo "WARN: TLS 1.3 not detected" >> "$RESULTS_FILE"
    fi
    
    # Test TLS 1.2
    if run_with_timeout 10 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -tls1_2 2>/dev/null | grep -q 'Verify return code: 0'"; then
        print_status "$GREEN" "✓ TLS 1.2 supported with valid certificate"
        echo "PASS: TLS 1.2 supported" >> "$RESULTS_FILE"
    elif run_with_timeout 10 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -tls1_2 2>&1 | grep -q 'BEGIN CERTIFICATE'"; then
        print_status "$YELLOW" "⚠ TLS 1.2 connection established but certificate verification failed"
        echo "WARN: TLS 1.2 connected but cert verification failed" >> "$RESULTS_FILE"
    else
        print_status "$RED" "✗ TLS 1.2 not supported or connection failed"
        echo "FAIL: TLS 1.2 not supported" >> "$RESULTS_FILE"
    fi
    
    # Test for weak protocols (should fail)
    print_status "$YELLOW" "Testing for deprecated/vulnerable protocols..."
    
    if run_with_timeout 5 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -ssl3 2>/dev/null | grep -q 'Verify return code: 0'"; then
        print_status "$RED" "✗ SSLv3 still supported (VULNERABLE)"
        echo "FAIL: SSLv3 supported (vulnerable)" >> "$RESULTS_FILE"
    else
        print_status "$GREEN" "✓ SSLv3 properly disabled"
        echo "PASS: SSLv3 disabled" >> "$RESULTS_FILE"
    fi
    
    if run_with_timeout 5 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -tls1 2>/dev/null | grep -q 'Verify return code: 0'"; then
        print_status "$RED" "✗ TLS 1.0 still supported (DEPRECATED)"
        echo "FAIL: TLS 1.0 supported (deprecated)" >> "$RESULTS_FILE"
    else
        print_status "$GREEN" "✓ TLS 1.0 properly disabled"
        echo "PASS: TLS 1.0 disabled" >> "$RESULTS_FILE"
    fi
    
    if run_with_timeout 5 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -tls1_1 2>/dev/null | grep -q 'Verify return code: 0'"; then
        print_status "$RED" "✗ TLS 1.1 still supported (DEPRECATED)"
        echo "FAIL: TLS 1.1 supported (deprecated)" >> "$RESULTS_FILE"
    else
        print_status "$GREEN" "✓ TLS 1.1 properly disabled"
        echo "PASS: TLS 1.1 disabled" >> "$RESULTS_FILE"
    fi
    
    # Check cipher suites
    print_status "$YELLOW" "Analyzing cipher suites..."
    if run_with_timeout 10 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' -cipher 'ALL' 2>/dev/null | grep 'Cipher.*:'" > "$LOG_DIR/ciphers.txt"; then
        if grep -qi "AES256\|CHACHA20" "$LOG_DIR/ciphers.txt"; then
            print_status "$GREEN" "✓ Strong ciphers detected"
            echo "PASS: Strong ciphers in use" >> "$RESULTS_FILE"
        else
            print_status "$YELLOW" "⚠ Cipher strength unclear"
            echo "WARN: Cipher strength needs verification" >> "$RESULTS_FILE"
        fi
    else
        print_status "$YELLOW" "⚠ Could not retrieve cipher information"
        echo "WARN: Cipher analysis failed" >> "$RESULTS_FILE"
    fi
    
    # Certificate validation
    print_status "$YELLOW" "Checking certificate information..."
    if run_with_timeout 10 "echo | openssl s_client -connect '$TARGET_HOST:$TARGET_PORT' 2>/dev/null | openssl x509 -noout -dates -subject" > "$LOG_DIR/cert_info.txt"; then
        if [ -s "$LOG_DIR/cert_info.txt" ]; then
            print_status "$GREEN" "✓ Certificate information retrieved"
            cat "$LOG_DIR/cert_info.txt"
            echo "PASS: Certificate present and readable" >> "$RESULTS_FILE"
        else
            print_status "$RED" "✗ Certificate validation failed - empty response"
            echo "FAIL: Certificate validation failed" >> "$RESULTS_FILE"
        fi
    else
        print_status "$RED" "✗ Certificate validation failed - connection error"
        echo "FAIL: Certificate validation failed" >> "$RESULTS_FILE"
    fi
}

# Test 3: Plaintext Sensitive Data Detection
test_plaintext_data() {
    print_header "TEST 3: PLAINTEXT SENSITIVE DATA DETECTION"
    
    echo -e "\n=== PLAINTEXT DATA TEST ===" >> "$RESULTS_FILE"
    
    # Check logs for sensitive data
    print_status "$YELLOW" "Scanning log files for plaintext sensitive data..."
    
    local log_dirs=("logs" "log" "/var/log" "tmp" "/tmp")
    local sensitive_patterns=("password" "api.key" "secret" "token" "credit.card" "ssn" "social.security" "email.*@.*com")
    local issues_found=false
    
    for log_dir in "${log_dirs[@]}"; do
        if [ -d "$log_dir" ] && [ -r "$log_dir" ]; then
            print_status "$YELLOW" "Checking $log_dir..."
            
            for pattern in "${sensitive_patterns[@]}"; do
                if find "$log_dir" -type f \( -name "*.log" -o -name "*.txt" \) 2>/dev/null | xargs grep -i "$pattern" 2>/dev/null | head -3; then
                    issues_found=true
                    print_status "$RED" "✗ Potential sensitive data found matching pattern: $pattern"
                fi
            done
        fi
    done
    
    # Check application files for hardcoded sensitive data
    print_status "$YELLOW" "Scanning source code for plaintext sensitive data..."
    
    local source_dirs=("." "src" "app" "config")
    
    for src_dir in "${source_dirs[@]}"; do
        if [ -d "$src_dir" ]; then
            # Look for common sensitive data patterns
            if grep -r -i "password.*=.*['\"].*['\"]" "$src_dir" --include="*.js" --include="*.py" --include="*.rb" --include="*.php" --include="*.java" --include="*.cs" 2>/dev/null | grep -v "placeholder\|example\|test\|sample" | head -2; then
                issues_found=true
                print_status "$RED" "✗ Hardcoded passwords found in source code"
            fi
            
            # Look for API keys
            if grep -r -E "api.key.*=.*['\"][a-zA-Z0-9]{20,}['\"]" "$src_dir" --include="*.js" --include="*.py" --include="*.rb" --include="*.php" --include="*.java" --include="*.cs" 2>/dev/null | head -2; then
                issues_found=true
                print_status "$RED" "✗ Hardcoded API keys found in source code"
            fi
        fi
    done
    
    # Check database configuration files
    print_status "$YELLOW" "Checking database configuration files..."
    
    local db_configs=("database.yml" "database.json" "db.config" ".env" "config.properties" "application.properties")
    
    for config in "${db_configs[@]}"; do
        if find . -name "$config" -type f 2>/dev/null | head -1 | xargs cat 2>/dev/null | grep -i "password\|secret" | grep -v "placeholder\|example"; then
            issues_found=true
            print_status "$RED" "✗ Database credentials may be in plaintext in $config"
        fi
    done
    
    if [ "$issues_found" = true ]; then
        echo "FAIL: Plaintext sensitive data detected" >> "$RESULTS_FILE"
        print_status "$RED" "✗ Plaintext sensitive data issues found!"
    else
        echo "PASS: No plaintext sensitive data detected" >> "$RESULTS_FILE"
        print_status "$GREEN" "✓ No obvious plaintext sensitive data found"
    fi
}

# Generate final report
generate_report() {
    print_header "GENERATING FINAL REPORT"
    
    echo -e "\n=== SUMMARY ===" >> "$RESULTS_FILE"
    echo "Audit completed on: $(date)" >> "$RESULTS_FILE"
    
    local pass_count=$(grep -c "PASS:" "$RESULTS_FILE" 2>/dev/null || echo "0")
    local warn_count=$(grep -c "WARN:" "$RESULTS_FILE" 2>/dev/null || echo "0")
    local fail_count=$(grep -c "FAIL:" "$RESULTS_FILE" 2>/dev/null || echo "0")
    
    echo "PASS: $pass_count" >> "$RESULTS_FILE"
    echo "WARN: $warn_count" >> "$RESULTS_FILE"
    echo "FAIL: $fail_count" >> "$RESULTS_FILE"
    
    print_status "$BLUE" "Report Summary:"
    print_status "$GREEN" "✓ Passed: $pass_count"
    print_status "$YELLOW" "⚠ Warnings: $warn_count"
    print_status "$RED" "✗ Failed: $fail_count"
    
    print_status "$BLUE" "Full report saved to: $RESULTS_FILE"
    
    # Show report content
    print_header "DETAILED REPORT"
    cat "$RESULTS_FILE"
    
    if [ "$fail_count" -gt 0 ]; then
        print_status "$RED" "⚠ Critical issues found! Review the report immediately."
        return 1
    elif [ "$warn_count" -gt 0 ]; then
        print_status "$YELLOW" "⚠ Some warnings found. Review recommended."
        return 0
    else
        print_status "$GREEN" "✓ All tests passed successfully!"
        return 0
    fi
}

# Usage function
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -u, --url URL          Target URL for testing (e.g., https://example.com)"
    echo "  -h, --host HOST        Target hostname for TLS testing"
    echo "  -p, --port PORT        Target port (default: 443)"
    echo "  --help                 Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 -u https://example.com -h example.com"
    echo "  $0 -u https://localhost:3000 -h localhost -p 3000"
    echo "  $0 -u http://localhost:4200 -h localhost -p 4200"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -u|--url)
            TARGET_URL="$2"
            shift 2
            ;;
        -h|--host)
            TARGET_HOST="$2"
            shift 2
            ;;
        -p|--port)
            TARGET_PORT="$2"
            shift 2
            ;;
        --help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Main execution
main() {
    print_header "CRYPTOGRAPHIC SECURITY AUDIT - macOS COMPATIBLE"
    print_status "$BLUE" "Target URL: ${TARGET_URL:-'Not specified'}"
    print_status "$BLUE" "Target Host: ${TARGET_HOST:-'Not specified'}"
    print_status "$BLUE" "Target Port: $TARGET_PORT"
    
    check_dependencies
    setup_environment
    
    test_encryption_practices
    test_tls_configuration
    test_plaintext_data
    
    generate_report
    
    exit $?
}

# Run main function
main