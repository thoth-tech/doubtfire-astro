# PDF Security Updates

## Overview
This document outlines the changes made to address a malicious code execution vulnerability related to the handling of PDFs in the Doubtfire application.

## Potential Impact if Unfixed
If this vulnerability is not addressed, attackers could upload PDFs containing embedded JavaScript or other malicious payloads. When these files are viewed, the malicious code could execute in the user's browser, potentially leading to:
- Unauthorized access to user data or session tokens.
- Execution of arbitrary code in the context of the application.
- Phishing attacks or redirection to malicious sites.
- Compromise of user accounts or escalation of privileges.

## Changes Implemented

### 1. Sanitize Uploaded PDFs
- Implemented server-side scanning for malicious JavaScript embedded in PDFs.
- **Action Taken:** Added a validation step during PDF uploads to detect and reject files containing embedded JavaScript or other malicious content.

### 2. Restrict or Disable JavaScript Execution in PDF Viewers
- JavaScript execution in PDFs is not required for the application.
- **Action Taken:** Configured the PDF viewer to disable JavaScript execution entirely, ensuring that no embedded scripts can run.

## Affected Components
The following components and files were updated as part of this security enhancement:
- **doubtfire-web:**
  - Updated the PDF.js integration and disabled JavaScript execution in the file viewer.
  - **Affected file:** `file-viewer.component.html`
- **doubtfire-api:**
  - Added server-side validation to sanitize uploaded PDFs.
  - **Affected files:** `file_helper.rb`, `file_helper_test.rb`

## Recommendations
- Regularly update dependencies like PDF.js to their latest secure versions.
- Continuously monitor for vulnerabilities in third-party libraries and implement patches promptly.
- **Sanitization for Other File Types:**
  - Strip metadata and embedded scripts from image files (e.g., using tools like ExifTool).
  - Validate and sanitize document files (e.g., DOCX, XLSX) using libraries that remove macros and embedded objects.
  - Restrict allowed file types and enforce strict MIME type checking.
  - Limit file size and scan for known exploit patterns.

## References
- [PDF.js Security Updates](https://github.com/mozilla/pdf.js/releases)
- [OWASP File Upload Security Guidelines](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)

## Version History
- **Version:** 1.0
- **Date:** 07/05/2025
- **Author:** Ibitope Fatoki
