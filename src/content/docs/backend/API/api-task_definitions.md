---
title: Doubtfire API
---

# API: units - Task Definitions

units : Operations about Units
This markdown document provides detailed documentation for the "Task definition" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "units" API has the following operations.

- **DELETE**: /api/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}
- **PUT**: /api/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}
- **GET**: /api/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments

## Detail of Operations related to units.

### GET: Get the group attachments for a given task definition.

GET /units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments`
- Method: `GET`
- Parameters:
  | Parameter           | Description          |Parameter Type| Data Type|Mandatory|
  |---------------------|----------------------|--------------|----------|---------|
  |unit_id              | Unit ID              | path         | integer  |Yes      |
  |task_def_id          | Task Definition ID   | path         | integer  |Yes      |
  |Username             | User username        | header       | string   |Yes      |
  |Auth_Token           | Authentication token | header       | string   |Yes      |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/units/1/task_definitions/1/tii_group_attachments'
  ```

- Response body:
  ```json
  [
    {
      "id": 1,
      "name": "Attachment 1",
      "status": "uploaded"
    },
    {
      "id": 2,
      "name": "Attachment 2",
      "status": "pending"
    }
  ]
  ```

### PUT: Trigger an action on the given group attachment.

PUT /units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}`
- Method: `PUT`
- Parameters:
  | Parameter  | Description                          |Parameter Type| Data Type|Mandatory|
  |------------|--------------------------------------|--------------|----------|---------|
  |unit_id     | Unit ID                              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID                   | path         | integer  |Yes      |
  |id          | Group Attachment ID                  | path         | integer  |Yes      |
  |action      | The action to perform (e.g., upload) | query        | string   |Yes      |
  |Username    | User username                        | header       | string   |Yes      |
  |Auth_Token  | Authentication token                 | header       | string   |Yes      |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X PUT --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -d 'action=upload' 'http://localhost:3000/units/1/task_definitions/1/tii_group_attachments/1'
  ```

- Response body:
  ```json
  {
    "id": 1,
    "name": "Attachment 1",
    "status": "has_id"
  }
  ```

### DELETE: Delete a group attachment.

DELETE /units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}`
- Method: `DELETE`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |id          | Group Attachment ID  | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |

- Response:
  `204`

- Example Request:

  ```bash
  curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/units/1/task_definitions/1/tii_group_attachments/1'
  ```

- Response body:
  ```
  true
  ```
