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
- **DELETE**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_resources
- **GET**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_resources
- **POST**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_resources
- **POST**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet
- **POST**: /api/units/{unit_id}/task_definitions/{task_def_id}/test_overseer_assessment

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

### DELETE: Remove the task resources for a given task

DELETE /units/{unit_id}/task_definitions/{task_def_id}/task_resources

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/task_resources`
- Method: `DELETE`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |

- Response:
  `204`

- Example Request:

  ```bash
  curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/units/1/task_definitions/1/task_resources'
  ```

- Response body:
  ```
  true
  ```

### GET: Download the task resources

GET /units/{unit_id}/task_definitions/{task_def_id}/task_resources

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/task_resources`
- Method: `GET`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/units/1/task_definitions/1/task_resources'
  ```

- Response body:
  ```
  <binary data of the zip file>
  ```

### POST: Upload the task resources for a given task

POST /units/{unit_id}/task_definitions/{task_def_id}/task_resources

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/task_resources`
- Method: `POST`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |
  |file        | Task resources zip   | form-data    | file     |Yes      |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X POST --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -F "file=@/path/to/resources.zip" 'http://localhost:3000/units/1/task_definitions/1/task_resources'
  ```

- Response body:
  ```
  true
  ```

### POST: Upload the task sheet for a given task

POST /units/{unit_id}/task_definitions/{task_def_id}/task_sheet

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/task_sheet`
- Method: `POST`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |
  |file        | Task resources zip   | form-data    | file     |Yes      |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X POST --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -F "file=@/path/to/task_sheet.pdf" 'http://localhost:3000/units/1/task_definitions/1/task_sheet'
  ```

- Response body:
  ```
  true
  ```

### POST: Test overseer assessment for a given task

POST /units/{unit_id}/task_definitions/{task_def_id}/test_overseer_assessment

- URL: `/units/{unit_id}/task_definitions/{task_def_id}/test_overseer_assessment`
- Method: `POST`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |
  |file 0      | File 0 (optional)    | form-data    | file     |No       |
  |file 1      | File 1 (optional)    | form-data    | file     |No       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X POST --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -F "file0=@/path/to/file0" -F "file1=@/path/to/file1" 'http://localhost:3000/units/1/task_definitions/1/test_overseer_assessment'
  ```

- Response body:
  ```json
  {
    "status": "Overseer assessment performed successfully"
  }
  ```
