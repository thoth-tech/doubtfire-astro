# OWASP Broken Access Control

## Introduction
Broken Access Control is a critical vulnerability where users can gain unauthorized access to restricted resources or perform actions outside their privileges. For example:
- Viewing or editing other users' data.
- Elevating user privileges unintentionally.

## Test Cases
- **Password Policy Enforcement**: Validate rules such as minimum length, complexity, and expiration.
- **Weak Password Rejection**: Attempt login with weak or compromised passwords.
- **Session Hijacking Simulation**: Verify secure session tokens with `HttpOnly` and `Secure` flags.

## Methodology
1. Use tools such as `OWASP ZAP` or `Burp Suite` to simulate attacks.
2. Check password policies via application forms or APIs.
3. Test session hijacking by manipulating cookies using browser dev tools or interception proxies.

## Results
Results of running the tests:
- Password policies are enforced correctly.
- Weak passwords are rejected successfully.
- Session tokens are secured with appropriate flags.

## Action Items
- Implement missing security flags.
- Harden password policy configurations.
