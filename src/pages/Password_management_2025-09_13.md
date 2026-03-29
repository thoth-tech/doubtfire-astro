title: Password Management
layout: ../layouts/BaseLayout.astro
---

# OnTrack Password Management Implementation

## Overview
This documentation explains the implementation of full password management in the OnTrack system under the Capstone project with Thoth Tech.
It includes user registration, password reset via email token, and authenticated password change.

## Technologies Used
- Angular (frontend components, routing, services)
- Node.js + Express (backend API endpoints)
- PostgreSQL (database with migration for reset tokens)
- Visual Studio Code
- Git (feature/password-management branch)
- Astro Framework (for documentation)

## Key Actions
- Created backend endpoints for register, forgot password, reset password, and change password.
- Added database migration for `reset_password_token` and `reset_password_sent_at`.
- Updated sign-in page to include "Forgot Password" link and improved error handling.
- Built new Angular components: `ForgotPassword` and `ResetPassword`.
- Updated routing (`doubtfire.states.ts`) and module declarations.
- Configured email service to send reset links.

---

## Testing Methodology

### Manual Testing Approach
The password management functionality was manually tested in a local development container using the Angular app served at `localhost:4200`.

- Step 1: Open sign-in page and click “Forgot Password.”
- Step 2: Enter email address and request reset link.
- Step 3: Check email inbox for reset link.
- Step 4: Click link and open reset password form.
- Step 5: Enter new password and confirm.

**Expected Result:** Password is updated successfully and user can log in with new credentials.
**Actual Result:** All steps worked as intended.

✅ This confirms that the password management workflow is functional.

### Screenshot (Test Output)
- Initial home page (no "Forgot Password" link):
  ![Initial Home](../assets/screenshots/Initial-home-page.png)

- Updated home page (with "Forgot Password" link):
  ![Updated Home](../assets/screenshots/Updated-home-page-with-forgot-password-link.png)

- Forgot Password form:
  ![Forgot Password Form](../assets/screenshots/Clicking-the-Reset-Link.png)

- Reset email received:
  ![Reset Email](../assets/screenshots/Reset-email-link-received.png)

- Change password screen:
  ![Change Password](../assets/screenshots/change-password-screen.png)

---

## Conclusion
This implementation delivers a complete password lifecycle for OnTrack users: registration, forgotten password recovery, token-based reset, and authenticated password change.
Future improvements may include automated testing using Angular testing libraries or Cypress.

## Notes
This feature improves both **security** and **user experience**, ensuring users can recover accounts safely while preventing unauthorized access.
