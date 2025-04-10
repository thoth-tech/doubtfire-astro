**Introduction**

Identification and authentication failures occur when an application improperly verifies users' identities or enforces security policies, allowing attackers to bypass authentication or assume other users' identities.

**Examples:**

- Weak or missing password policies.
- Authentication bypass via brute force attacks.

**Test Cases**

- **Password Policy Enforcement**:
  - Ensure rules for minimum and maximum length, complexity, uniqueness, and expiration are enforced.
- **Weak Password Rejection**:
  - Attempt login using weak or commonly used passwords.

**Methodology**

1. **Tool Setup**:
    - Utilized Burp Suite and manual analysis to verify enforcement of password policy rules and login behaviours.
2. **Password Policy Validation**:
    - Tested the following defined password policies:
        - Password length between 15 and 30 characters.
        - No inclusion of restricted characters: @ ' $ ! & \* / \\ " ; or spaces.
        - Password uniqueness: must differ from the previous five passwords.
        - Password expiration: enforced reset after 18 months of inactivity.
        - Multi-Factor Authentication (MFA) via Duo Mobile App.
3. **Weak Password Testing**:
    - Attempted authentication using commonly known weak passwords and passwords not adhering to complexity and length standards.

**Newly Identified Potential Vulnerability**

- **jQuery 1.8.0 (Extremely Outdated)**:
  - Potential critical vulnerability identified but not yet tested:
    - CVE-2020-11022, CVE-2020-11023, CVE-2012-6708, CVE-2015-9251: Known cross-site scripting (XSS) vulnerabilities.
    - Risk assessment: High due to the possibility of exploitation for executing malicious scripts.
    - Recommended action: Immediate upgrade to jQuery 3.7.1 or higher, pending controlled environment testing and authorization.

**Results**

- **Password Policy Enforcement**:
  - Successfully enforced all stated policies:
    - Rejected passwords outside the 15–30-character range.
    - Blocked passwords containing prohibited special characters.
    - Enforced password uniqueness effectively (previous five passwords could not be reused).
    - Clearly outlined and executed password expiration and lockout policies.
    - MFA via Duo Mobile consistently enforced, significantly enhancing security.
- **Weak Password Rejection**:
  - All attempts to authenticate with weak or compromised passwords were effectively rejected, ensuring robust protection against common password-based attacks.

**Actions Required**

- **Enhanced User Notification**:
  - Introduce more frequent reminders approaching the 18-month password expiration period to prevent inadvertent account lockouts.
- **Improved Security Monitoring**:
  - Enhance logging and alert mechanisms to identify potential brute force attempts or abnormal authentication behaviours.

**Conclusion**

The audit confirms the robustness of Deakin University's password policies and authentication mechanisms. These measures effectively mitigate identity-related risks. However, addressing the newly identified potential vulnerability through controlled testing and immediate library upgrades is necessary to further enhance security.
