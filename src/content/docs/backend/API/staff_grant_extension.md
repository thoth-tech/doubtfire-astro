---
title: Doubtfire API Documentation
---

# API: Staff Grant Extension 
staff_grant_extension: Operation to allow staff to grant task extensions to students
This markdown document provides detailed documentation for the "staff_grant_extension" API endpoint, including its URL, method, parameters, responses, and example request using curl.

This "staff_grant_extension" API has the following operation:

- **POST**  /api/units/{unit_id}/staff-grant-extension

## Detail of Operations related to staff_grant_extension.

### POST:Grant extensions to multiple students
POST /api/units/{unit_id}/staff-grant-extension

- URL: `/api/units/{unit_id}/staff_grant_extension`
- Method: `POST`
- Description: This endpoint allows staff to grant extensions to multiple students at once for a specific task. The operation is atomic—either all extensions are granted or none are. Students not found in the unit are automatically skipped without affecting the transaction
- Parameters:

| Parameter          | Description               | Parameter Type | Data Type | Mandatory |
| -------------------| --------------------------| -------------- | --------- | --------- |
| student_ids        | List of student IDs       | formData       | Array     | Yes       |
| task_definition_id | ID of the task definition | formData       | Integer   | Yes       |
| weeks_requested    | Number of weeks to extend | formData       | Integer   | Yes       |
| comment            | Reason for extension      | formData       | String    | Yes       |

- Response: 
 `201`

- Example Request:

  ```bash
  curl -X POST http://localhost:3000/api/units/123/staff-grant-extension \
    -H 'Content-Type: application/json' \
    -H 'Username: tutor' \
    -H 'Auth_Token: abc123def456' \
    -d '{
      "student_ids": [456, 676],
      "task_definition_id": 789,
      "weeks_requested": 1,
      "comment": "Unit wide extension"
    }'

- Response Body:
  ```json
    {
    "successful": [
        {
        "student_id": 456,
        "project_id": 999,
        "weeks_requested": 1,
        "extension_response": "Extension granted. New due date: Jun 1",
        "task_status": {
            "status": "in-progress",
            "extensions": 1
        }
        }
    ],
    "skipped": [],
    "failed": []
    }
  ```
- Skipped Response Body: 
  ```json
    {
    "successful": [],
    "skipped": [
        {
        "student_id": 999999,
        "reason": "Student not found in unit"
        }
    ],
    "failed": []
    }
  ```
- Error Responses: 
  ```json
    {
      "student_id": 123,
      "project_id": 999,
      "error": "Task is past due date"
    }
  ```