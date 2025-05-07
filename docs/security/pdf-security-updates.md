# PDF Security Updates

## Overview
This document outlines the changes made to address a malicious code execution vulnerability related to the handling of PDFs in the Doubtfire application.

## Changes Implemented

### 1. Sanitize Uploaded PDFs
- Implemented server-side scanning for malicious JavaScript embedded in PDFs.
- **Action Taken:** Added a validation step during PDF uploads to detect and reject files containing embedded JavaScript or other malicious content.

### 2. Restrict or Disable JavaScript Execution in PDF Viewers
- JavaScript execution in PDFs is no longer required for the application.
- **Action Taken:** Configured the PDF viewer to disable JavaScript execution entirely, ensuring that no embedded scripts can run.

## Affected Components
The following components were updated as part of this security enhancement:
- **doubtfire-web:** Updated the PDF.js integration and disabled JavaScript execution in the file viewer.
- **doubtfire-api:** Added server-side validation to sanitize uploaded PDFs.

## Recommendations
- Regularly update dependencies like PDF.js to their latest secure versions.
- Continuously monitor for vulnerabilities in third-party libraries and implement patches promptly.

## References
- [PDF.js Security Updates](https://github.com/mozilla/pdf.js/releases)
- [OWASP File Upload Security Guidelines](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)

## Version History
- **Version:** 1.0
- **Date:** 07/05/2025
- **Author:** Ibitope Fatoki
