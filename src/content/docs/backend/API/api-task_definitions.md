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
- **DELETE**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources
- **GET**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources
- **POST**: /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/task_pdf
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/tasks
- **POST** /api/units/{unit_id}/task_definitions/task_pdfs
- **DELETE** /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet
- **DELETE** /api/units/{unit_id}/task_definitions/{id}
- **PUT** /api/units/{unit_id}/task_definitions/{id}
- **POST** /api/units/{unit_id}/task_definitions

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

### POST: Upload the task assessment resources for a given task

POST /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources`
- Method: `POST`
- Parameters:
  | Parameter  | Description                     |Parameter Type| Data Type|Mandatory|
  |------------|-------------------------------- |--------------|----------|---------|
  |unit_id     | Unit ID                         | path         | integer  |Yes      |
  |task_def_id | Task Definition ID              | path         | integer  |Yes      |
  |Username    | User username                   | header       | string   |Yes      |
  |Auth_Token  | Authentication token            | header       | string   |Yes      |
  |file        | Task assessment resources zip   | form-data    | file     |Yes      |

- Response:
  `201 OK`

- Example Request:

  ```bash
  curl -X POST --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -F 'file=@/path/to/resources.zip' 'http://localhost:3000/api/units/1/task_definitions/2/task_assessment_resources'
  ```

- Response body:
  ```
  true
  ```

### DELETE: Remove the task assessment resources for a given task

DELETE /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources`
- Method: `DELETE`
- Parameters:
  | Parameter  | Description          |Parameter Type| Data Type|Mandatory|
  |------------|----------------------|--------------|----------|---------|
  |unit_id     | Unit ID              | path         | integer  |Yes      |
  |task_def_id | Task Definition ID   | path         | integer  |Yes      |
  |Username    | User username        | header       | string   |Yes      |
  |Auth_Token  | Authentication token | header       | string   |Yes      |

- Response:
  `204 OK`

- Example Request:

  ```bash
  curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/api/units/1/task_definitions/2/task_assessment_resources'
  ```

- Response body:
  ```
  true
  ```

### GET: Download the task assessment resources

GET /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources`
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
  curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/api/units/1/task_definitions/2/task_assessment_resources'
  ```

- Response body:
  ```
  <binary data of the zip file>
  ```
  ### GET: Download the task sheet containing the details related to performing that task
GET /api/units/{unit_id}/task_definitions/{task_def_id}/task_pdf

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/task_pdf`
- Method: `GET` 
- Parameter:

    | Parameter     | Description                                | Parameter Type | Data Type | Mandatory |
    |---------------|--------------------------------------------|----------------|-----------|-----------|
    | unit_id       | The unit to upload tasks for               | path           | integer   | Yes       |
    | task_def_id   | The task definition to get the PDF of      | path           | integer   | Yes       |
    | as_attachment | Whether or not to download file as attachment. Default is false. | query  | boolean   | No        |
    | Username      | Username of the user                       | header         | string    | Yes       |
    | Auth_Token    | Authentication token                       | header         | string    | Yes       |

- Response: `200`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/pdf' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' 'http://localhost:3000/api/units/1/task_definitions/1/task_pdf?as_attachment=true'

	```
- Response Body:
	```
    Download task_pdf?as_attachment=true
	```


--------------------------------------------------------------------

### GET: Download the tasks related to a task definition
GET /api/units/{unit_id}/task_definitions/{task_def_id}/tasks

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/tasks`
- Method: `GET` 
- Parameter:

| Parameter     | Description                           | Parameter Type | Data Type | Mandatory |
|---------------|---------------------------------------|----------------|-----------|-----------|
| unit_id       | The unit containing the task definition | path           | integer   | Yes     |
| task_def_id   | The task definition's id              | path           | integer   | Yes       |
| Username      | Username of the user                  | header         | string    | Yes       |
| Auth_Token    | Authentication token                  | header         | string    | Yes       |

- Response: `200`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: Ym3A6yiuucA-82kcxcgF' 'http://localhost:3000/api/units/1/task_definitions/1/tasks'
	```
- Response Body:
	```json
    [
        {
            "project_id": 2,
            "id": 12,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-22",
            "submission_date": "2024-04-20T10:56:18.978Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 3,
            "id": 31,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-21",
            "submission_date": "2024-04-20T10:56:24.059Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 4,
            "id": 45,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-16",
            "submission_date": "2024-04-20T10:57:04.514Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 5,
            "id": 63,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-21",
            "submission_date": "2024-04-20T10:57:35.703Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 7,
            "id": 86,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-19",
            "submission_date": "2024-04-20T10:58:28.084Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 8,
            "id": 105,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-16",
            "submission_date": "2024-04-20T10:58:33.116Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 9,
            "id": 127,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-16",
            "submission_date": "2024-04-20T10:58:38.421Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 10,
            "id": 146,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-17",
            "submission_date": "2024-04-20T10:58:43.259Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 11,
            "id": 165,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-23",
            "submission_date": "2024-04-20T10:59:13.681Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 12,
            "id": 177,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-23",
            "submission_date": "2024-04-20T10:59:16.725Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 13,
            "id": 201,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-19",
            "submission_date": "2024-04-20T10:59:22.471Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 15,
            "id": 226,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-18",
            "submission_date": "2024-04-20T10:59:48.270Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 16,
            "id": 245,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-23",
            "submission_date": "2024-04-20T10:59:53.349Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 17,
            "id": 269,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-19",
            "submission_date": "2024-04-20T11:00:28.887Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 18,
            "id": 288,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "complete",
            "completion_date": "2024-03-20",
            "submission_date": "2024-04-20T11:00:33.670Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 14,
            "id": 223,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "working_on_it",
            "completion_date": null,
            "submission_date": "2024-04-20T10:59:27.895Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 6,
            "id": 77,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "redo",
            "completion_date": null,
            "submission_date": "2024-04-20T10:58:04.345Z",
            "times_assessed": 1,
            "similarity_flag": false,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        },
        {
            "project_id": 1,
            "id": 3,
            "task_definition_id": 1,
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "status": "demonstrate",
            "completion_date": "2024-03-18",
            "submission_date": "2024-04-20T10:56:15.653Z",
            "times_assessed": 1,
            "similarity_flag": true,
            "grade": null,
            "quality_pts": -1,
            "has_extensions": 0
        }
    ]
	```

--------------------------------------------------------------------------------------------------

### POST: Upload a zip file containing the task pdfs for a given task
POST /api/units/{unit_id}/task_definitions/task_pdfs

- URL: `/api/units/{unit_id}/task_definitions/task_pdfs`
- Method: `POST` 
- Parameter:

    | Parameter | Description                   | Parameter Type | Data Type | Mandatory |
    |-----------|-------------------------------|----------------|-----------|-----------|
    | unit_id   | The unit to upload tasks for | path           | integer   | Yes       |
    | file      | Batch file upload            | formData       | file      | Yes        |
    | Username  | Username                      | header         | string    | Yes       |
    | Auth_Token| Authentication token          | header         | string    | Yes       |

- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: S8Qzr1uoToYidkezNeZL' -F file=@"1.1P submission.zip"  'http://localhost:3000/api/units/1/task_definitions/task_pdfs'
	```
- Response Body:
	```json
    {
        "success": [
            {
            "row": "1.1P submission.pdf",
            "message": "Added as task 1.1P"
            }
        ],
        "errors": [],
        "ignored": []
    }
	```

--------------------------------------------------------------------------------------------
### DELETE: Remove the task sheet for a given task
DELETE /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet`
- Method: `DELETE` 
- Parameter:

    | Parameter   | Description                | Parameter Type | Data Type | Mandatory |
    |-------------|----------------------------|----------------|-----------|-----------|
    | unit_id     | The related unit           | path           | integer   | Yes       |
    | task_def_id | The related task definition| path           | integer   | Yes       |
    | Username    | Username                   | header         | string    | Yes       |
    | Auth_Token  | Authentication token       | header         | string    | Yes       |

- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/task_definitions/12/task_sheet'
	```
- Response Body:
	```
    true
	```
----------------------------------------------------------------------------------
### POST: Upload the task sheet for a given task
POST /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet

- URL: `/api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet`
- Method: `POST` 
- Parameter:

    | Parameter   | Description                   | Parameter Type | Data Type | Mandatory |
    |-------------|-------------------------------|----------------|-----------|-----------|
    | unit_id     | The related unit              | path           | integer   | Yes       |
    | task_def_id | The related task definition   | path           | integer   | Yes       |
    | file        | The task sheet pdf            | formData       | file      | Yes       |
    | Username    | Username                      | header         | string    | Yes       |
    | Auth_Token  | Authentication token          | header         | string    | Yes       |

- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: S8Qzr1uoToYidkezNeZL' -F file=@"1.1P submission.pdf"  'http://localhost:3000/api/units/1/task_definitions/1/task_sheet'
	```
- Response Body:
	```
    true
	```


### DELETE: Delete a task definition
DELETE /api/units/{unit_id}/task_definitions/{id}

- URL: `/api/units/{unit_id}/task_definitions/{id}`
- Method: `DELETE` 
- Parameter: 
 
    | Parameter | Description | Parameter Type | Data Type | Mandatory |
    |-----------|-------------|----------------|-----------|-----------|
    | Username  | Username of the user | header | string | Yes |
    | Auth_Token | Authentication token | header | string | Yes |
    | unit_id | ID of the unit | header | integer | Yes |
    | id | ID of the task | path | integer | Yes |


- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/task_definitions/1'
	```
- Response Body:
	```
    true
	```


---------------------------------------------------------------------

### PUT: Edits the given task definition
- **PUT** /api/units/{unit_id}/task_definitions/{id}

- URL: `/api/units/{unit_id}/task_definitions/{id}`
- Method: `PUT` 
- Parameter:

    | Parameter                | Description                                               | Parameter Type | Data Type |Mandatory|
    |--------------------------|-----------------------------------------------------------|----------------|-----------|--|
    | id                       | (required) The task id to edit                            | path           | integer   |Yes|
    | task_def[tutorial_stream_abbr] | The abbreviation of the tutorial stream              | formData       | string    | |
    | task_def[name]           | The name of this task def                                 | formData       | string    | |
    | task_def[description]    | The description of this task def                          | formData       | string    | |
    | task_def[weighting]      | The weighting of this task                                | formData       | integer   | |
    | task_def[target_grade]   | Target grade for task                                     | formData       | integer   | |
    | task_def[group_set_id]   | Related group set                                         | formData       | integer   | |
    | task_def[start_date]     | The date when the task should be started                  | formData       | date      | |
    | task_def[target_date]    | The date when the task is due                              | formData       | date      | |
    | task_def[due_date]       | The deadline date                                         | formData       | date      | |
    | task_def[abbreviation]   | The abbreviation of the task                               | formData       | string    | |
    | task_def[restrict_status_updates] | Restrict updating of the status to staff            | formData       | boolean   | |
    | task_def[upload_requirements]   | Task file upload requirements                        | formData       | string    | |
    | task_def[plagiarism_checks]    | The list of checks to perform                        | formData       | string    | |
    | task_def[plagiarism_warn_pct]  | The percent at which to record and warn about plagiarism | formData       | integer   | |
    | task_def[is_graded]      | Whether or not this task definition is a graded task       | formData       | boolean   | |
    | task_def[max_quality_pts] | A range for quality points when quality is assessed       | formData       | integer   | |
    | task_def[assessment_enabled] | Enable or disable assessment                             | formData       | boolean   | |
    | task_def[overseer_image_id] | The id of the Docker image name for overseer              | formData       | integer   | |
    | Username                 | (required) Username                                       | header         | string    | Yes|
    | Auth_Token               | (required) Authentication token                           | header         | string    | Yes| 
    | unit_id                  | (required)                                                 | header         | integer   |Yes |

- Response: `200`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' -d 'task_def%5Boverseer_image_id%5D=6578' 'http://localhost:3000/api/units/1/task_definitions/1'
	```
- Response Body:
	```json
    {
        "id": 1,
        "abbreviation": "1.1P",
        "name": "Pass Task 1.1 - Hello World",
        "description": "As a first step, create the classic 'Hello World' program. This will help ensure that you have all of the software installed correctly, and are ready to move on with creating other,,, programs.",
        "weighting": 1,
        "target_grade": 0,
        "target_date": "2024-03-19",
        "due_date": "2024-04-08",
        "start_date": "2024-03-12",
        "upload_requirements": [
            {
            "key": "file0",
            "name": "HelloWorld.pas",
            "type": "code"
            },
            {
            "key": "file1",
            "name": "Screenshot",
            "type": "image"
            }
        ],
        "tutorial_stream_abbr": "wrkshop-1",
        "plagiarism_checks": null,
        "plagiarism_warn_pct": 90,
        "restrict_status_updates": false,
        "group_set_id": null,
        "has_task_sheet": true,
        "has_task_resources": true,
        "has_task_assessment_resources": false,
        "is_graded": false,
        "max_quality_pts": 0,
        "overseer_image_id": 6578,
        "assessment_enabled": false,
        "moss_language": null
    }
	```


----------------------------------------------------------------------

### POST: Add a new task definition to the given unit
POST /api/units/{unit_id}/task_definitions

- URL: `/api/units/{unit_id}/task_definitions`
- Method: `POST` 
- Parameter:


    | Parameter                          | Description                                            | Parameter Type | Data Type | Mandatory |
    |------------------------------------|--------------------------------------------------------|----------------|-----------|-----------|
    | task_def[tutorial_stream_abbr]     | The abbreviation of tutorial stream                    | formData       | string    | No        |
    | task_def[name]                     | The name of this task def                              | formData       | string    | Yes       |
    | task_def[description]              | The description of this task def                       | formData       | string    | Yes       |
    | task_def[weighting]                | The weighting of this task                             | formData       | integer   | Yes       |
    | task_def[target_grade]             | Minimum grade for task                                 | formData       | integer   | Yes       |
    | task_def[group_set_id]             | Related group set                                      | formData       | integer   | No        |
    | task_def[start_date]               | The date when the task should be started               | formData       | date      | Yes       |
    | task_def[target_date]              | The date when the task is due                          | formData       | date      | Yes       |
    | task_def[due_date]                 | The deadline date                                      | formData       | date      | No        |
    | task_def[abbreviation]             | The abbreviation of the task                           | formData       | string    | Yes       |
    | task_def[restrict_status_updates]  | Restrict updating of the status to staff               | formData       | boolean   | No        |
    | task_def[upload_requirements]      | Task file upload requirements                          | formData       | string    | No        |
    | task_def[plagiarism_checks]        | The list of checks to perform                          | formData       | string    | No        |
    | task_def[plagiarism_warn_pct]      | The percent at which to record and warn about plagiarism | formData       | integer   | Yes       |
    | task_def[is_graded]                | Whether or not this task definition is a graded task   | formData       | boolean   | No        |
    | task_def[max_quality_pts]          | A range for quality points when quality is assessed    | formData       | integer   | Yes       |
    | task_def[assessment_enabled]       | Enable or disable assessment                           | formData       | boolean   | No        |
    | task_def[overseer_image_id]        | The id of the Docker image for overseer                | formData       | integer   | No        |
    | Username                           | Username                                               | header         | string    | Yes       |
    | Auth_Token                         | Authentication token                                   | header         | string    | Yes       |
    | unit_id                            | The id for the unit                                    | path           | integer   | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: text/error' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' -d 'task_def%5Bname%5D=test_test123&task_def%5Bdescription%5D=test_test1234&task_def%5Bweighting%5D=55&task_def%5Btarget_grade%5D=0&task_def%5Bstart_date%5D=2024-06-09T00%3A00%3A00.000Z&task_def%5Btarget_date%5D=2024-09-20T00%3A00%3A00.000Z&task_def%5Babbreviation%5D=test_test123&task_def%5Brestrict_status_updates%5D=true&task_def%5Bplagiarism_warn_pct%5D=40&task_def%5Bis_graded%5D=true&task_def%5Bmax_quality_pts%5D=99' 'http://localhost:3000/api/units/1/task_definitions'
	```
- Response Body:
	```json
    {
        "id": 1234,
        "name": "Assignment 1",
        "description": "This is the first assignment",
        "weighting": 10,
        "target_grade": 80,
        "group_set_id": 5678,
        "start_date": "2024-06-01",
        "target_date": "2024-06-30",
        "due_date": "2024-07-05",
        "abbreviation": "ASS1",
        "restrict_status_updates": true,
        "upload_requirements": "PDF only",
        "plagiarism_checks": "Turnitin",
        "plagiarism_warn_pct": 20,
        "is_graded": true,
        "max_quality_pts": 5,
        "assessment_enabled": true,
        "overseer_image_id": 9876
    }
	```



----------------------------------------------------------------------