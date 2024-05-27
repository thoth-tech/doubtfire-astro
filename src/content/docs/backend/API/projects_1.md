---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Projects (page 1/2)
projects : Operations about projects

This markdown document provides detailed documentation for the "projects" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "projects" API has the following operations.

## Following 13 Operations are listed below for projects API
- **GET** /api/projects/{id}/task_def_id/{task_definition_id}/submission_files
- **GET** /api/projects/{id}/task_def_id/{task_definition_id}/submission_details
- **PUT** /api/projects/{id}/task_def_id/{task_definition_id}
- **GET** /api/projects/{project_id}/refresh_tasks/{task_definition_id}
- **DELETE** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}
- **GET** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}
- **POST** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}
- **GET** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments
- **POST** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments
- **GET** /api/projects/{id}/task_def_id/{task_definition_id}/submissions/latest
- **GET** /api/projects/{id}/task_def_id/{task_definition_id}/submissions/timestamps/{timestamp}
- **PUT** /api/projects/{id}/task_def_id/{task_definition_id}/overseer_assessment/{oa_id}/trigger
- **GET** /api/projects/{id}/task_def_id/{task_definition_id}/submissions/timestamps

------------------------------------------------------------


### GET: Get the files associated with a submission
GET /api/projects/{id}/task_def_id/{task_definition_id}/submission_files

- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/submission_files`
- Method: `GET`
- Parameter:

    | Parameter          | Description                                       | Parameter Type | Data Type | Mandatory |
    |--------------------|---------------------------------------------------|----------------|-----------|-----------|
    | id                 | The project id to locate                          | path           | integer   | Yes       |
    | task_definition_id | The id of the task definition of the task to get the files from | path           | integer   | Yes       |
    | Username           | Username                                          | header         | string    | Yes       |
    | Auth_Token         | Authentication token                              | header         | string    | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: student_1' --header 'Auth_Token: TCCc359yLt6W_XnENjyc' 'http://localhost:3000/api/projects/2/task_def_id/1/submission_files'
	```
- Response Body:
	```
    Download submission file
	```
---------------------------------------------------------

### GET: Get the submission details of a task, indicating if it has a pdf to view
GET /api/projects/{id}/task_def_id/{task_definition_id}/submission_details

- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/submission_details`
- Method: `GET`
- Parameter:

    | Parameter          | Description                                       | Parameter Type | Data Type | Mandatory |
    |--------------------|---------------------------------------------------|----------------|-----------|-----------|
    | id                 | The project id to locate                          | path           | integer   | Yes       |
    | task_definition_id | The id of the task definition of the task to get the files from | path           | integer   | Yes       |
    | Username           | Username                                          | header         | string    | Yes       |
    | Auth_Token         | Authentication token                              | header         | string    | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: TCCc359yLt6W_XnENjyc' 'http://localhost:3000/api/projects/2/task_def_id/1/submission_details'
	```
- Response Body:
	```json
    {
        "has_pdf": true,
        "submission_date": "2024-04-20T10:56:18.978Z",
        "processing_pdf": false
     }
	```

-------------------------------------------------------------
### PUT: Update a task using its related project and task definition
PUT /api/projects/{id}/task_def_id/{task_definition_id}

- URL: `/api/projects/{id}/task_def_id/{task_definition_id}`
- Method: `PUT`
- Parameter:

   
| Parameter            | Description                                                                            | Parameter Type | Data Type | Mandatory |
|----------------------|----------------------------------------------------------------------------------------|----------------|-----------|-----------|
| trigger              | New status                                                                             | formData       | string    |           |
| include_in_portfolio | Indicate if this task should be in the portfolio                                        | formData       | boolean   |           |
| grade                | Grade value if task is a graded task (required if task definition is a graded task)     | formData       | integer   |           |
| quality_pts          | Quality points value if task has quality assessment                                     | formData       | integer   |           |
| Username             | Username                                                                               | header         | string    | Yes       |
| Auth_Token           | Authentication token                                                                   | header         | string    | Yes       |
| id                   | The project id to locate                                                               | path           | integer   | Yes       |
| task_definition_id   | The id of the task definition of the task to get the files from                        | path           | integer   | Yes       |



- Response: `200 OK`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: TCCc359yLt6W_XnENjyc' -d 'include_in_portfolio=true' 'http://localhost:3000/api/projects/2/task_def_id/1'
	```
- Response Body:
	```json
    {
        "id": 12,
        "project_id": 2,
        "task_definition_id": 1,
        "status": "complete",
        "due_date": "2024-04-08",
        "submission_date": "2024-04-20",
        "completion_date": "2024-03-22",
        "extensions": 3,
        "times_assessed": 1,
        "quality_pts": -1,
        "include_in_portfolio": true,
        "new_stats": "{\"red_pct\":0.0,\"grey_pct\":0.53,\"orange_pct\":0.0,\"blue_pct\":0.03,\"green_pct\":0.44,\"order_scale\":47.0}"
    }
	```
-------------------------------------------------------------------------------

### GET: Refresh the most frequently changed task details for a project - allowing easy refresh of student details

GET /api/projects/{project_id}/refresh_tasks/{task_definition_id}

- URL: `/api/projects/{project_id}/refresh_tasks/{task_definition_id}`
- Method: `GET`
- Parameter:


    | Parameter          | Description                                                                    | Parameter Type | Data Type | Mandatory |
    |--------------------|--------------------------------------------------------------------------------|----------------|-----------|-----------|
    | project_id         | The id of the project with the task, or tasks to get                           | path           | integer   | Yes       |
    | task_definition_id | The id of the task definition to get, when not provided all tasks are returned | path           | integer   |     Yes      |
    | Username           | Username                                                                       | header         | string    | Yes       |
    | Auth_Token         | Authentication token                                                           | header         | string    | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: TCCc359yLt6W_XnENjyc' 'http://localhost:3000/api/projects/2/refresh_tasks/1'
	```
- Response Body:
	```json
    {
        "task_definition_id": 1,
        "status": "complete",
        "due_date": "2024-04-08T10:54:39.909Z",
        "extensions": 3
    }
	```

--------------------------------------------------------------------
### DELETE: Delete a comment
DELETE /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}`
- Method: `DELETE` 
- Parameter:


    | Parameter          | Description          | Parameter Type | Data Type | Mandatory |
    |--------------------|----------------------|----------------|-----------|-----------|
    | Username           | Username             | header         | string    | Yes       |
    | Auth_Token         | Authentication token | header         | string    | Yes       |
    | project_id         | The project id       | path           | integer   | Yes       |
    | task_definition_id | The task definition id | path         | integer   | Yes       |
    | id                 | The id               | path           | integer   | Yes       |


- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/comments/956'
	```
- Response Body:
	```
    Comment deleted successfully.
	```
--------------------------------------------------------------------------

### GET: Get an attachment related to a task comment
GET /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}`
- Method: `GET` 
- Parameter:


    | Parameter          | Description                                                 | Parameter Type | Data Type | Mandatory |
    |--------------------|-------------------------------------------------------------|----------------|-----------|-----------|
    | as_attachment      | Whether or not to download file as attachment. Default is false. | query          | boolean   |           |
    | Username           | Username                                                    | header         | string    | Yes       |
    | Auth_Token         | Authentication token                                        | header         | string    | Yes       |
    | project_id         | The project id                                              | path           | integer   | Yes       |
    | task_definition_id | The task definition id                                      | path           | integer   | Yes       |
    | id                 | The id                                                      | path           | integer   | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/comments/957?as_attachment=true'
	```
- Response Body:
	```
    Download task comment.
	```

--------------------------------------------------------------------------------
### POST: Mark a comment as unread
POST /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{id}`
- Method: `POST` 
- Parameter:

    | Parameter          | Description           | Parameter Type | Data Type | Mandatory |
    |--------------------|-----------------------|----------------|-----------|-----------|
    | Username           | Username              | header         | string    | Yes       |
    | Auth_Token         | Authentication token  | header         | string    | Yes       |
    | project_id         | The project id        | path           | integer   | Yes       |
    | task_definition_id | The task definition id| path           | integer   | Yes       |
    | id                 | The id                | path           | integer   | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/json' --header 'Accept: text/error' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/comments/957'
	```
- Response Body:
	```
    Comment marked as unread
	```

------------------------------------------------------------------------

### GET: Get the comments related to a task
GET /api/projects/{project_id}/task_def_id/{task_definition_id}/comments

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/comments`
- Method: `GET` 
- Parameter:


    | Parameter          | Description           | Parameter Type | Data Type | Mandatory |
    |--------------------|-----------------------|----------------|-----------|-----------|
    | Username           | Username              | header         | string    | Yes       |
    | Auth_Token         | Authentication token  | header         | string    | Yes       |
    | project_id         | The project id        | path           | integer   | Yes       |
    | task_definition_id | The task definition id| path           | integer   | Yes       |



- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/comments'
	```
- Response Body:
	```json
    [
    {
        "id": 22,
        "comment": "Ready for Feedback",
        "has_attachment": false,
        "type": "status",
        "is_new": false,
        "reply_to_id": null,
        "author": {
        "id": 24,
        "first_name": "Layla",
        "last_name": "Kihn",
        "email": "student_1@doubtfire.com"
        },
        "recipient": {
        "id": 2,
        "first_name": "Andrew",
        "last_name": "Cain",
        "email": "acain@doubtfire.com"
        },
        "created_at": "2024-04-20T10:56:18.985Z",
        "recipient_read_time": null,
        "date": "2024-04-20T10:56:18.985Z",
        "status": "ready_for_feedback"
    },
    {
        "id": 23,
        "comment": "Time Exceeded",
        "has_attachment": false,
        "type": "status",
        "is_new": false,
        "reply_to_id": null,
        "author": {
        "id": 2,
        "first_name": "Andrew",
        "last_name": "Cain",
        "email": "acain@doubtfire.com"
        },
        "recipient": {
        "id": 24,
        "first_name": "Layla",
        "last_name": "Kihn",
        "email": "student_1@doubtfire.com"
        },
        "created_at": "2024-04-20T10:56:19.080Z",
        "recipient_read_time": null,
        "date": "2024-04-20T10:56:19.080Z",
        "status": "time_exceeded"
    },
    {
        "id": 957,
        "comment": "Need extension for task ",
        "has_attachment": false,
        "type": "extension",
        "is_new": false,
        "reply_to_id": null,
        "author": {
        "id": 24,
        "first_name": "Layla",
        "last_name": "Kihn",
        "email": "student_1@doubtfire.com"
        },
        "recipient": {
        "id": 2,
        "first_name": "Andrew",
        "last_name": "Cain",
        "email": "acain@doubtfire.com"
        },
        "created_at": "2024-05-16T10:15:50.578Z",
        "recipient_read_time": "2024-05-16T10:15:50.674Z",
        "granted": true,
        "assessed": true,
        "date_assessed": "2024-05-16T10:15:50.632Z",
        "weeks_requested": 1,
        "extension_response": "Time extended to Mon Apr  8",
        "task_status": "complete"
    }
    ]
	```
--------------------------------------------------------------------------

### POST: Add a comment
POST /api/projects/{project_id}/task_def_id/{task_definition_id}/comments

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/comments`
- Method: `POST` 
- Parameter:

    | Parameter          | Description                                  | Parameter Type | Data Type | Mandatory |
    |--------------------|----------------------------------------------|----------------|-----------|-----------|
    | comment            | The comment text to add to the task          | formData       | string    |      Yes     |
    | attachment         | Image, sound, PDF, or video comment file     | formData       | file      |           |
    | reply_to_id        | The comment to which this comment is replying| formData       | integer   |           |
    | Username           | Username                                     | header         | string    | Yes       |
    | Auth_Token         | Authentication token                         | header         | string    | Yes       |
    | project_id         | The project id                               | path           | integer   | Yes       |
    | task_definition_id | The task definition id                       | path           | integer   | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' -F comment=test comments addition -F attachment=@"1.1P submission.pdf"  'http://localhost:3000/api/projects/2/task_def_id/1/comments'
	```
- Response Body:
	```json
    {
        "id": 958,
        "comment": "pdf document",
        "has_attachment": true,
        "type": "pdf",
        "is_new": false,
        "reply_to_id": null,
        "author": {
            "id": 24,
            "first_name": "Layla",
            "last_name": "Kihn",
            "email": "student_1@doubtfire.com"
        },
        "recipient": {
            "id": 2,
            "first_name": "Andrew",
            "last_name": "Cain",
            "email": "acain@doubtfire.com"
        },
        "created_at": "2024-05-17T01:43:40.597Z",
        "recipient_read_time": null
     }
	```

------------------------------------------------------------------

### GET: Get the result of the submission of a task made last
GET /api/projects/{id}/task_def_id/{task_definition_id}/submissions/latest

- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/submissions/latest`
- Method: `GET` 
- Parameter:

    | Parameter          | Description           | Parameter Type | Data Type | Mandatory |
    |--------------------|-----------------------|----------------|-----------|-----------|
    | Username           | Username              | header         | string    | Yes       |
    | Auth_Token         | Authentication token  | header         | string    | Yes       |
    | id                 | The project id        | path           | integer   | Yes       |
    | task_definition_id | The task definition id| path           | integer   | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/submissions/latest'
	```
- Response Body:
	```
    Download the submission
	```

-------------------------------------------------------------------

### GET: Get the result of the submission of a task made at the given timestamp
GET /api/projects/{id}/task_def_id/{task_definition_id}/submissions/timestamps/{timestamp}


- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/submissions/timestamps/{timestamp}`
- Method: `GET` 
- Parameter:


    | Parameter          | Description            | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------|----------------|-----------|-----------|
    | Username           | Username               | header         | string    | Yes       |
    | Auth_Token         | Authentication token   | header         | string    | Yes       |
    | id                 | The project id         | path           | integer   | Yes       |
    | task_definition_id | The task definition id | path           | integer   | Yes       |
    | timestamp          | The timestamp          | path           | string    | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: text/html' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/submissions/timestamps/2024-05-17T01%3A43%3A40.597Z'
	```
- Response Body:
	```
    Output.txt
	```
------------------------------------------------------------------------

### PUT: Trigger an overseer assessment to run again
PUT /api/projects/{id}/task_def_id/{task_definition_id}/overseer_assessment/{oa_id}/trigger

- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/overseer_assessment/{oa_id}/trigger`
- Method: `PUT` 
- Parameter:


    | Parameter          | Description            | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------|----------------|-----------|-----------|
    | Username           | Username               | header         | string    | Yes       |
    | Auth_Token         | Authentication token   | header         | string    | Yes       |
    | id                 | The project id         | path           | integer   | Yes       |
    | task_definition_id | The task definition id | path           | integer   | Yes       |
    | oa_id              | The oa id              | path           | integer   | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/json' --header 'Accept: text/error' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/overseer_assessment/1/trigger'
	```
- Response Body:
	```json
    {
        "message": "Overseer assessment for project ID 2, task definition ID 1, and OA ID 1 has been triggered successfully."
    }
	```
---------------------------------------------------------------------------

### GET: Get the timestamps of the last 10 submissions of a task
GET /api/projects/{id}/task_def_id/{task_definition_id}/submissions/timestamps


- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/submissions/timestamps`
- Method: `GET` 
- Parameter:


    | Parameter          | Description            | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------|----------------|-----------|-----------|
    | Username           | Username               | header         | string    | Yes       |
    | Auth_Token         | Authentication token   | header         | string    | Yes       |
    | id                 | The project id         | path           | integer   | Yes       |
    | task_definition_id | The task definition id | path           | integer   | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: e3S85hJep7hs315YtWDG' 'http://localhost:3000/api/projects/2/task_def_id/1/submissions/timestamps'
	```
- Response Body:
	```
    [
        Submission 1: 2024-05-08T11:20:00.347Z,
        Submission 2: 2024-05-12T03:23:10.453Z,
        Submission 3: 2024-05-17T01:43:40.597Z,
    ]
    
	```


-----------------------------------------------------------------


