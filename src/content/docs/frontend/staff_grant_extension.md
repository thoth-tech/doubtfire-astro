---
title: Doubtfire Component Documentation
---

# Component: Staff Grant Extension 


## Component Overview

| Name                            | File Path                                                                       |
|---------------------------------|---------------------------------------------------------------------------------|
| `GrantExtensionDialogComponent` | `src/app/admin/modals/grant-extension-form/grant-extension-dialog.component.ts` |
| `GrantExtensionFormComponent`   | `src/app/admin/modals/grant-extension-form/grant-extension-form.component.ts`   |

This feature allows staff to grant an extension for a task to a specific student using a modal form dialog. It submits data to the backend via the `ExtensionService`.

---

## UI Behavior

- Launched via a dialog modal
- Form fields:
  - **Student** (dropdown)
  - **Extension Duration** (slider in days)
  - **Reason** (textarea)
  - **Optional Notes**
- Two buttons:
  - `Cancel`: Closes modal
  - `Grant Extension`: Submits data

---

## Component Responsibilities

### `GrantExtensionDialogComponent`

- Displays the modal container
- Injects and closes `MatDialogRef`
- Embeds `<f-grant-extension-form>` inside dialog UI

### `GrantExtensionFormComponent`

- Handles form logic with Angular Reactive Forms
- Maintains a hardcoded student list (`students[]`)
- Sends `POST` request using `ExtensionService`
- Manages validation, UI state (`isSubmitting`), and error handling

---

## Sample Usage

### Dialog Trigger

```ts
this.dialog.open(GrantExtensionDialogComponent);
```

---

## Sample Usage 

| Field    | FormControl Name | Type   | Validation        | Notes                                 |
| -------- | ---------------- | ------ | ----------------- | ------------------------------------- |
| Student  | `student`        | select | Required          | Populated from hardcoded `students[]` |
| Duration | `extension`      | slider | Required, min = 1 | Values from 1 to 30 days              |
| Reason   | `reason`         | text   | Required          | User-provided reason for extension    |
| Notes    | `notes`          | text   | Optional          | Additional context                    |

---

## Example Request 

```ts
this.extensionService.grantExtension(unitId, payload).subscribe(...)
```
Calls backend endpoint:

```ruby
POST /api/units/:unit_id/staff-grant-extension
```

--- 

## Success Behavior

Displays snackbar:
"Extension granted successfully!"

Closes dialog

## Error Handling
Displays snackbar with error message from backend or a generic fallback.

Example:

```ts
this.snackBar.open(`Failed to grant extension: ${errorMsg}`, 'Close', { duration: 5000 });
```
