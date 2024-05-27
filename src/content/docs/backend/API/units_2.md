---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Units (Page 2)
units : Operations about units

This markdown document provides detailed documentation for the "units" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

## This "units" API page has the following operations
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/task_pdf
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/tasks
- **POST** /api/units/{unit_id}/task_definitions/task_pdfs
- **DELETE** /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet
- **DELETE** /api/units/{unit_id}/task_definitions/{id}
- **PUT** /api/units/{unit_id}/task_definitions/{id}
- **POST** /api/units/{unit_id}/task_definitions
- **GET** /api/units/{unit_id}/learning_alignments/class_details
- **GET** /api/units/{unit_id}/learning_alignments/class_stats
- **DELETE** /api/units/{unit_id}/learning_alignments/{id}
- **PUT** /api/units/{unit_id}/learning_alignments/{id}
- **GET** /api/units/{unit_id}/learning_alignments
- **POST** /api/units/{unit_id}/learning_alignments
- **GET** /api/units/{unit_id}/learning_alignments/csv
- **POST** /api/units/{unit_id}/learning_alignments/csv
- **GET** /api/units/{unit_id}/outcomes/csv
- **POST** /api/units/{unit_id}/outcomes/csv
- **DELETE** /api/units/{unit_id}/outcomes/{id}
- **PUT** /api/units/{unit_id}/outcomes/{id}
- **POST** /api/units/{unit_id}/outcomes



-------------------------------------------------------------------

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

### GET: Return unit learning alignment values with median stats for each tutorial
GET /api/units/{unit_id}/learning_alignments/class_details

- URL: `/api/units/{unit_id}/learning_alignments/class_details`
- Method: `GET` 
- Parameter:

    | Parameter  | Description            | Parameter Type | Data Type | Mandatory |
    |------------|------------------------|----------------|-----------|-----------|
    | unit_id    | The id of the unit     | path           | integer   | Yes       |
    | Username   | Username               | header         | string    | Yes       |
    | Auth_Token | Authentication token   | header         | string    | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: H8jTVdiyWzBz28cqkgDe' 'http://localhost:3000/api/units/1/learning_alignments/class_details'
	```
- Response Body:
	```json
    {
        "1": {
            "1": {
            "median": 10.5,
            "lower": 8.4,
            "upper": 29.4,
            "min": 8.2,
            "max": 33
            },
            "2": {
            "median": 22.4,
            "lower": 11.4,
            "upper": 31.5,
            "min": 7.8,
            "max": 39.6
            },
            "3": {
            "median": 14.6,
            "lower": 11.6,
            "upper": 31.4,
            "min": 10.8,
            "max": 41.2
            },
            "4": {
            "median": 4.8,
            "lower": 0.8,
            "upper": 8.3,
            "min": 0.8,
            "max": 8.8
            }
        },
        "3": {
            "1": {
            "median": 37.3,
            "lower": 31,
            "upper": 52,
            "min": 0.7,
            "max": 54.4
            },
            "2": {
            "median": 41.5,
            "lower": 38,
            "upper": 64.5,
            "min": 0.7,
            "max": 70.5
            },
            "3": {
            "median": 42.9,
            "lower": 38.5,
            "upper": 52.5,
            "min": 0.7,
            "max": 54.3
            },
            "4": {
            "median": 10.4,
            "lower": 5.1,
            "upper": 15,
            "min": 0,
            "max": 16
            }
        },
    }    
	```

-----------------------------------------------------------------------

### GET: Return unit learning alignment median values
GET /api/units/{unit_id}/learning_alignments/class_stats

- URL: `/api/units/{unit_id}/learning_alignments/class_stats`
- Method: `GET` 
- Parameter:

    | Parameter  | Description                          | Parameter Type | Data Type | Mandatory |
    |------------|--------------------------------------|----------------|-----------|-----------|
    | unit_id    | The id of the unit                   | path           | integer   | Yes       |
    | Username   | Username                             | header         | string    | Yes       |
    | Auth_Token | Authentication token                 | header         | string    | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 9v88UUcnEy1cN7jyvUTK' 'http://localhost:3000/api/units/1/learning_alignments/class_stats'
	```
- Response Body:
	```json
    {
        "1": {
            "median": 33.7,
            "lower": 10.6,
            "upper": 40,
            "min": 0.7,
            "max": 54.4
        },
        "2": {
            "median": 39.6,
            "lower": 22.4,
            "upper": 46.3,
            "min": 0.7,
            "max": 70.5
        },
        "3": {
            "median": 40.7,
            "lower": 14.6,
            "upper": 48.3,
            "min": 0.7,
            "max": 54.7
        },
        "4": {
            "median": 7.7,
            "lower": 3.7,
            "upper": 13.2,
            "min": 0,
            "max": 16
        }
    }
	```


------------------------------------------------------------------------

### DELETE: Delete the alignment between a task and unit outcome
- **DELETE** /api/units/{unit_id}/learning_alignments/{id}

- URL: `/api/units/{unit_id}/learning_alignments/{id}`
- Method: `DELETE` 
- Parameter:


    | Parameter    | Description                                            | Parameter Type | Data Type | Mandatory |
    |--------------|--------------------------------------------------------|----------------|-----------|-----------|
    | id           | The id of the task alignment                           | path           | integer   | Yes       |
    | unit_id      | The id of the unit                                     | path           | integer   | Yes       |
    | Username     | Username                                               | header         | string    | Yes       |
    | Auth_Token   | Authentication token                                   | header         | string    | Yes       |


- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: text/error' --header 'Username: aadmin' --header 'Auth_Token: 9v88UUcnEy1cN7jyvUTK' 'http://localhost:3000/api/units/5/learning_alignments/1'
	```
- Response Body:
	```
    true
	```


-----------------------------------------------------------------------

### PUT: Update the alignment between a task and unit outcome
PUT /api/units/{unit_id}/learning_alignments/{id}


- URL: `/api/units/{unit_id}/learning_alignments/{id}`
- Method: `PUT` 
- Parameter:
        
    | Parameter    | Description                                            | Parameter Type | Data Type | Mandatory |
    |--------------|--------------------------------------------------------|----------------|-----------|-----------|
    | id           | The id of the task alignment                           | path           | integer   | Yes       |
    | unit_id      | The id of the unit                                     | path           | integer   | Yes       |
    | description  | The description of the alignment                       | formData       | string    | No        |
    | rating       | The rating for this link, indicating the strength of this alignment | formData | integer   | No        |
    | Username     | Username                                               | header         | string    | Yes       |
    | Auth_Token   | Authentication token                                   | header         | string    | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 9v88UUcnEy1cN7jyvUTK' -d 'description=aligntest&rating=5' 'http://localhost:3000/api/units/1/learning_alignments/1'
	```
- Response Body:
	```json
    {
        "id": 1,
        "description": "aligntest",
        "rating": 5,
        "learning_outcome_id": 2,
        "task_definition_id": 1
    }
	```


------------------------------------------------------------------------
### GET: Get the task/outcome alignment details for a unit or a project
GET /api/units/{unit_id}/learning_alignments

- URL: `/api/units/{unit_id}/learning_alignments`
- Method: `GET` 
- Parameter:


    | Parameter  | Description                                         | Parameter Type | Data Type | Mandatory |
    |------------|-----------------------------------------------------|----------------|-----------|-----------|
    | unit_id    | The id of the unit                                  | path           | integer   | Yes       |
    | project_id | The id of the student project to get the alignment from | query        | integer   | Yes       |
    | Username   | User Username                                           | header         | string    | Yes       |
    | Auth_Token | Authentication token                               | header         | string    | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: mRHxyNJYkdxiCushUmm_' 'http://localhost:3000/api/units/1/learning_alignments?project_id=1'
	```
- Response Body:
	```json
    [
        {
            "id": 104,
            "description": "Simulated rationale text...",
            "rating": 5,
            "learning_outcome_id": 1,
            "task_definition_id": 1,
            "task_id": 3
        },
        {
            "id": 105,
            "description": "Simulated rationale text...",
            "rating": 5,
            "learning_outcome_id": 1,
            "task_definition_id": 2,
            "task_id": 4
        },
        {
            "id": 106,
            "description": "Simulated rationale text...",
            "rating": 3,
            "learning_outcome_id": 3,
            "task_definition_id": 2,
            "task_id": 4
        },
        {
            "id": 107,
            "description": "Simulated rationale text...",
            "rating": 3,
            "learning_outcome_id": 4,
            "task_definition_id": 2,
            "task_id": 4
        },
        {
            "id": 108,
            "description": "Simulated rationale text...",
            "rating": 4,
            "learning_outcome_id": 3,
            "task_definition_id": 3,
            "task_id": 5
        },
    ]
	```

-----------------------------------------------------------------------------------

### POST: Add an outcome to a unit's task definition
POST /api/units/{unit_id}/learning_alignments

- URL: `/api/units/{unit_id}/learning_alignments`
- Method: `POST` 
- Parameter:

    | Parameter          | Description                                         | Parameter Type | Data Type | Mandatory |
    |--------------------|-----------------------------------------------------|----------------|-----------|-----------|
    | unit_id            | The id of the unit                                  | path           | integer   | Yes       |
    | learning_outcome_id | The id of the learning outcome                     | formData       | integer   | Yes       |
    | task_definition_id | The id of the task definition                       | formData       | integer   | Yes       |
    | project_id         | The id of the project if this is a self reflection | formData       | integer   | Yes       |
    | description        | The ILOs description                                | formData       | string    | Yes       |
    | rating             | The rating for this link, indicating the strength of this alignment | formData | integer   | Yes       |
    | Username           | User username                                        | header         | string    | Yes       |
    | Auth_Token         | Authentication token                               | header         | string    | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: mRHxyNJYkdxiCushUmm_' -d 'learning_outcome_id=2&task_definition_id=2&project_id=1&description=test_ILO&rating=5' 'http://localhost:3000/api/units/1/learning_alignments'
	```
- Response Body:
	```json
    {
        "id": 684,
        "description": "test_ILO",
        "rating": 5,
        "learning_outcome_id": 2,
        "task_definition_id": 2,
        "task_id": 4
    }
	```

------------------------------------------------------------------------------------------------------

### GET: Download CSV of task alignments in this unit

GET /api/units/{unit_id}/learning_alignments/csv

- URL: `/api/units/{unit_id}/learning_alignments/csv`
- Method: `GET` 
- Parameter:


    | Parameter  | Description                                | Parameter Type | Data Type | Mandatory |
    |------------|--------------------------------------------|----------------|-----------|-----------|
    | unit_id    | The id of the unit                         | path           | integer   | Yes       |
    | project_id | The id of the student project to get from  | query          | integer   | No        |
    | Username   | Username                                   | header         | string    | Yes       |
    | Auth_Token | Authentication token                       | header         | string    | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: atutor' --header 'Auth_Token: m5s8cJP38mzC85iQz7FM' 'http://localhost:3000/api/units/1/learning_alignments/csv?project_id=1'
	```
- Response Body:
	```
    Download csv?project_id=1
	```
-------------------------------------------------------------------------------------------------


### POST: Upload CSV of task to outcome alignments
POST /api/units/{unit_id}/learning_alignments/csv

- URL: `/api/units/{unit_id}/learning_alignments/csv`
- Method: `POST` 
- Parameter:


    | Parameter   | Description                                | Parameter Type | Data Type | Mandatory |
    |-------------|--------------------------------------------|----------------|-----------|-----------|
    | file        | CSV upload file.                           | formData       | file      |           |
    | project_id  | The id of the student project to upload the alignment to | formData | integer |           |
    | Username    | Username                                   | header         | string    | Yes       |
    | Auth_Token  | Authentication token                       | header         | string    | Yes       |
    | unit_id     | The id of the unit                         | path           | integer   | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: m5s8cJP38mzC85iQz7FM' -F file=@"Book2.xlsx" -F project_id=1  'http://localhost:3000/api/units/1/learning_alignments/csv'
	```
- Response Body:
	```json
    {
        "success": [],
        "ignored": [],
        "errors": []
    }
	```
--------------------------------------------------------------------------

### GET: Download the outcomes for a unit to a csv
GET /api/units/{unit_id}/outcomes/csv

- URL: `/api/units/{unit_id}/outcomes/csv`
- Method: `GET` 
- Parameter:

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | unit_id     |                        | path           | integer   | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' 'http://localhost:3000/api/units/1/outcomes/csv'
	```
- Response Body:
	```
    Download csv
	```
----------------------------------------------------------------------

### POST: Upload the outcomes for a unit from a csv
POST /api/units/{unit_id}/outcomes/csv

- URL: `/api/units/{unit_id}/outcomes/csv`
- Method: `POST` 
- Parameter:


    | Parameter  | Description                  | Parameter Type | Data Type | Mandatory |
    |------------|------------------------------|----------------|-----------|-----------|
    | file       | CSV upload file.             | formData       | file      |           |
    | unit_id    | The unit to upload tasks to  | path           | integer   | Yes       |
    | Username   | Username                     | header         | string    | Yes       |
    | Auth_Token | Authentication token         | header         | string    | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' -F file=@"Book2.xlsx"  'http://localhost:3000/api/units/1/outcomes/csv'
	```
- Response Body:
	```json
    {
        "success": [],
        "errors": [],
        "ignored": []
    }
	```
---------------------------------------------------------------------

### DELETE: Delete an outcome from a unit
DELETE /api/units/{unit_id}/outcomes/{id}

- URL: `/api/units/{unit_id}/outcomes/{id}`
- Method: `DELETE` 
- Parameter:

    | Parameter  | Description                      | Parameter Type | Data Type | Mandatory |
    |------------|----------------------------------|----------------|-----------|-----------|
    | unit_id    | The id for the unit              | path           | integer   | Yes       |
    | id         | The id for the outcome you wish to delete | path           | integer   | Yes       |
    | Username   | Username                         | header         | string    | Yes       |
    | Auth_Token | Authentication token             | header         | string    | Yes       |


- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: DCj-W7zLU3RX6qazApjQ' 'http://localhost:3000/api/units/1/outcomes/1'
	```
- Response Body:
	```
    true
	```
------------------------------------------------------------------------

### PUT: Update ILO
PUT /api/units/{unit_id}/outcomes/{id}

- URL: `/api/units/{unit_id}/outcomes/{id}`
- Method: `PUT` 
- Parameter:

    | Parameter    | Description                                | Parameter Type | Data Type | Mandatory |
    |--------------|--------------------------------------------|----------------|-----------|-----------|
    | unit_id      | The unit ID for which the ILO belongs to   | path           | integer   | Yes       |
    | name         | The ILOs new name                          | formData       | string    | No        |
    | description  | The ILOs new description                   | formData       | string    | No        |
    | abbreviation | The ILOs new abbreviation                  | formData       | string    | No        |
    | ilo_number   | The ILOs new sequence number               | formData       | integer   | No        |
    | Username     | Username                                   | header         | string    | Yes       |
    | Auth_Token   | Authentication token                       | header         | string    | Yes       |
    | id           | The ID of the ILO to update                | path           | integer   | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' -d 'abbreviation=tettettetet' 'http://localhost:3000/api/units/1/outcomes/1'
	```
- Response Body:
	```json
    {
        "id": 1,
        "ilo_number": 4,
        "abbreviation": "test_test",
        "name": "Functional Decomposition",
        "description": "Use modular and functional decomposition to break problems down functionally, represent the resulting structures diagrammatically, and implement these structures in code as functions and procedures.\r\n"
    }
	```

-------------------------------------------------------------------------

### POST: Add an outcome to a unit
POST /api/units/{unit_id}/outcomes

   
- URL: `/api/units/{unit_id}/outcomes`
- Method: `POST` 
- Parameter:

    | Parameter    | Description                                | Parameter Type | Data Type | Mandatory |
    |--------------|--------------------------------------------|----------------|-----------|-----------|
    | unit_id      | The unit ID for which the ILO belongs to   | path           | integer   | Yes       |
    | name         | The ILOs name                              | formData       | string    | Yes       |
    | description  | The ILOs description                       | formData       | string    | Yes       |
    | abbreviation | The ILOs new abbreviation                  | formData       | string    | No        |
    | Username     | Username                                   | header         | string    | Yes       |
    | Auth_Token   | Authentication token                       | header         | string    | Yes       |

- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: EJbyGkogpxtnNjXcvisj' -d 'name=outcome_111_test&description=test_111&abbreviation=test_ILO1' 'http://localhost:3000/api/units/1/outcomes'
	```
- Response Body:
	```json
    {
        "id": 12,
        "ilo_number": 5,
        "abbreviation": "test_ILO1",
        "name": "outcome_111_test",
        "description": "test_111"
    }

	```
