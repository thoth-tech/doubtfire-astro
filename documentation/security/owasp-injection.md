# OWASP Injection

## Introduction
Injection vulnerabilities occur when an application improperly handles user inputs, allowing attackers to execute unintended commands or query the database. Common examples include:
- SQL injection
- Command injection
- NoSQL injection

**Examples of Injection Attacks:**
- Providing malicious SQL queries via form fields.
- Injecting shell commands through poorly validated input fields.

## Test Cases
- **SQL Injection:**
  - Attempt SQL injection attacks on database-driven forms and APIs using tools like `sqlmap`.
- **Command Injection:**
  - Attempt to inject shell commands through user input fields or APIs.
- **NoSQL Injection:**
  - Test applications using NoSQL databases for vulnerabilities.

## Methodology
1. Use automated tools like `sqlmap` and `Burp Suite` to test injection vulnerabilities.
2. Test manually by crafting malicious inputs for application forms, APIs, and query parameters.
3. Validate that input sanitization and parameterized queries are used throughout the codebase.

## Results
- SQL injection attempts were blocked by input validation.
- Command injection vectors were tested and confirmed secure.
- All identified injection points were remediated.

## Actions Required
- Regularly scan the codebase for injection vulnerabilities.
- Use parameterized queries and prepared statements.
- Implement strict input validation and sanitization.
