# Web Security Audit: Broken Access Control Vulnerability Report

## Introduction

Broken Access Control is a critical security vulnerability where an application fails to properly restrict access to resources, allowing users to perform actions beyond their intended permissions. This vulnerability is ranked #1 in the OWASP Top 10 Web Application Security Risks (2021) due to its prevalence and severe impact.

Examples of Broken Access Control include:

- A regular user accessing administrator functionalities
- A user viewing or modifying another user's data by manipulating resource identifiers
- Using authorization tokens across different user contexts
- Bypassing access controls through URL manipulation
- Accessing sensitive API endpoints without proper authentication

In the context of Doubtfire, these vulnerabilities could allow students to view other students' submissions, modify grades, access administrative functions, or view sensitive institutional data.

## Test Cases

Our security audit focused on the following test categories:

1. **Vertical Privilege Escalation**: Testing if regular users can perform administrator-only actions
2. **Insecure Direct Object References (IDOR)**: Testing if users can access resources of other users by manipulating identifiers
3. **Session Token Misuse**: Testing if authentication tokens can be used across different user contexts
4. **URL Manipulation**: Testing if modifying URL parameters can bypass access controls
5. **Missing Access Controls**: Testing if sensitive endpoints can be accessed without authentication
6. **HTTP Method Manipulation**: Testing if changing HTTP methods can bypass access controls
7. **Function Level Access Controls**: Testing if sensitive functions are properly protected

## Methodology

### Tools Required

- Bash shell environment (Linux/macOS, or Windows with WSL/Git Bash)
- cURL command-line tool
- Access to test environment with admin and regular user credentials

### Testing Procedure

1. **Setup**:
   - Clone the repository containing the test script
   - Make the script executable: `chmod +x broken_access_control_test.sh`
   - Configure the API_URL variable in the script (default: `http://localhost:3000`)

2. **Execution**:
   - Run the script: `./broken_access_control_test.sh`
   - The script will output results to the console and save detailed logs to a timestamped file

3. **Understanding Results**:
   - **PASS (Green)**: The test confirmed proper access controls are in place
   - **FAIL (Red)**: The test identified a security vulnerability that requires attention
   - **INCONCLUSIVE/SKIPPED (Yellow)**: The test requires further investigation or manual verification
   - The script differentiates between various response types:
     - 401/403/419 responses for authenticated requests (expected denial)
     - 405 Method Not Allowed (acceptable for certain tests)
     - Empty arrays/null responses (potential information disclosure)

4. **Manual Verification**:
   - For UI-related vulnerabilities, manually check if regular users can access `/#/admin/units`
   - Verify path traversal protection by testing various URL patterns in the browser
   - Test endpoints that returned inconclusive results with different parameters or methods

### Script Details

The `broken_access_control_test.sh` script:

1. Performs authentication to obtain admin and regular user tokens
2. Systematically tests each access control category
3. Interprets responses based on HTTP status codes and content
4. Provides a detailed report of findings with recommendations
5. Logs all results for future reference and compliance documentation

The script is designed to be comprehensive, testing all API endpoints documented in the Doubtfire API specification.

## Results

After running the security audit, we identified the following issues:

### Critical Vulnerabilities

1. **Insecure Direct Object References (IDOR)**:
   - Users can access other users' data by manipulating the user ID
   - Status 200 was returned with full user profile information
   - This allows any authenticated user to view sensitive information of other users

2. **Missing Access Controls on Sensitive Endpoints**:
   - The `/api/settings` endpoint returns configuration data without authentication
   - This reveals system configuration including external integrations

3. **Path Traversal Risk**:
   - While API path traversal tests returned 404 status codes, further manual verification confirmed that regular users can access the admin creation page in the UI
   - This frontend vulnerability allows unauthorized access to administrative functionality

### Inconclusive Results Requiring Investigation

1. **Endpoints Returning Empty Results Without Authentication**:
   - `/api/activity_types`, `/api/campuses`, `/api/teaching_periods`, and `/api/tii_eula` return 200 status with empty arrays/null values
   - These endpoints should require authentication even when returning empty data

2. **Function Level Access Controls**:
   - Teaching period creation attempts resulted in validation errors (400) rather than permission denial
   - The endpoint processes the request and fails on validation instead of rejecting due to insufficient permissions

3. **Regular User Resource Access**:
   - Test user couldn't access permitted units (403 "Unable to list units")
   - This may be legitimate if the test user has no assigned units, but should be confirmed

### Successful Controls

The application successfully implemented:
- Protection against vertical privilege escalation attempts
- Session token binding and validation
- HTTP method restrictions (405 responses for inappropriate methods)
- Access controls on many critical API endpoints

## Required Actions

Based on our findings, we recommend the following actions:

### Immediate Actions

1. **Fix IDOR Vulnerability**:
   - Implement proper authorization checks in the user controller
   - Ensure users can only access their own profile information
   - Add role-based access control for user data access

2. **Secure Settings Endpoint**:
   - Require authentication for the `/api/settings` endpoint
   - Implement role-based access to configuration data
   - Consider moving sensitive configuration to a protected admin-only endpoint

3. **Fix Frontend Access Controls**:
   - Implement proper route protection in the frontend application
   - Prevent student accounts from accessing `/#/admin/units`
   - Ensure admin components are not rendered for non-admin users

### Recommended Improvements

1. **Consistent Authentication Checks**:
   - Add authentication requirements to all API endpoints, even those returning empty results
   - Implement uniform authorization checks that run before request processing
   - Return consistent 401/403 responses instead of empty data arrays

2. **Enhance Function Level Controls**:
   - Ensure permission checks occur before parameter validation
   - Return clear authorization errors rather than validation errors for unauthorized requests

3. **Implement Comprehensive Logging**:
   - Add detailed logging for all access control failures
   - Set up alerts for potential authorization bypass attempts 
   - Include sufficient context in logs to identify potential attack patterns

4. **Regular Security Testing**:
   - Include access control testing in the CI/CD pipeline
   - Re-run the security test after implementing fixes to confirm remediation
   - Expand tests as new endpoints are developed
