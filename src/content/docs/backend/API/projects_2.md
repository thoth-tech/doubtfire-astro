---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Projects (page 2/2)
projects : Operations about projects

This markdown document provides detailed documentation for the "projects" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "projects" API has the following operations.

## Following 13 Operations are listed below for projects API
- **GET** /api/projects/{id}/task_def_id/{task_definition_id}/submission
- **POST** /api/projects/{id}/task_def_id/{task_definition_id}/submission
- **PUT** /api/projects/{id}/task_def_id/{task_definition_id}/submission
- **GET** /api/projects
- **POST** /api/projects
- **GET** /api/projects/{id}
- **PUT** /api/projects/{id}
- **PUT** /api/projects/{project_id}/task_def_id/{task_definition_id}/assess_extension/{task_comment_id}
- **POST** /api/projects/{project_id}/task_def_id/{task_definition_id}/request_extension
- **POST** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/
{task_comment_id}/discussion_comment/reply
- **GET** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/
{task_comment_id}/discussion_comment/response
- **GET** /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/
{task_comment_id}/discussion_comment/prompt_number/{prompt_number}
- **POST** /api/projects/{project_id}/task_def_id/{task_definition_id}/discussion_comments

--------------------------------------------------------


### GET: Retrieve submission document included for the task id
GET /api/projects/{id}/task_def_id/{task_definition_id}/submission

- URL: `GET /api/projects/{id}/task_def_id/{task_definition_id}/submission`
- Method: `GET`
-Parameter:

    | Parameter         | Description                                   | Parameter Type | Data Type | Mandatory |
    |-------------------|-----------------------------------------------|----------------|-----------|-----------|
    | trigger           | The update trigger                            | formData       | string    |           |
    | campus_id         | Campus this project is part of, or -1 for no campus | formData  | integer   |           |
    | enrolled          | Enrol or withdraw this project                | formData       | boolean   |           |
    | target_grade      | New target grade                              | formData       | integer   |           |
    | submitted_grade   | New submitted grade                           | formData       | integer   |           |
    | compile_portfolio| Schedule a construction of the portfolio      | formData       | boolean   |           |
    | grade             | New grade                                     | formData       | integer   |           |
    | old_grade         | Old grade to check it has not changed...      | formData       | integer   |           |
    | grade_rationale  | New grade rationale                           | formData       | string    |           |
    | Username          | Username (required)                           | header         | string    | Yes       |
    | Auth_Token        | Authentication token (required)               | header         | string    | Yes       |
    | id                | The ID (required)                             | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/pdf' --header 'Username: student_1' --header 'Auth_Token: VzCEC68Bx7D4cBfqQKmp' 'http://localhost:3000/api/projects/2/task_def_id/1/submissionn?as_attachment=true'
    ```

- Response Body:
    ```bash
    Download submission.pdf 
    ```
----------------------------------------------------------

### POST: Upload and generate doubtfire-task-specific submission document
POST /api/projects/{id}/task_def_id/{task_definition_id}/submission

- URL: `/api/projects/{id}/task_def_id/{task_definition_id}/submission`
- Method: `POST`
- Parameters: 

    | Parameter            | Description                                                           | Parameter Type | Data Type | Mandatory |
    |----------------------|-----------------------------------------------------------------------|----------------|-----------|-----------|
    | file0                | file 0.                                                               | formData       | file      |           |
    | file1                | file 1.                                                               | formData       | file      |           |
    | contributions        | Contribution details JSON, eg: [ { project_id: 1, pct:'0.44', pts: 4 }, ... ] | formData  | undefined |           |
    | alignment_data       | Data for task alignment, eg: [ { ilo_id: 1, rating: 5, rationale: 'Hello' }, ... ] | formData  | undefined |           |
    | trigger              | Can be need_help to indicate upload is not a ready to mark submission  | formData       | string    |           |
    | accepted_tii_eula   | Whether or not the user has accepted the TII EULA as part of the submission. | formData  | boolean   |           |
    | Username             | Username (required)                                                   | header         | string    | Yes       |
    | Auth_Token           | Authentication token (required)                                       | header         | string    | Yes       |
    | id                   | The ID (required)                                                      | path           | integer   | Yes       |
    | task_definition_id  | The task definition ID (required)                                      | path           | integer   | Yes       |

- Respons: `201`

- Example Request: 
    ```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: wcDisuoKC65qfBmGmdKH' -F file0=@"Doc3.pdf" -F file1=@"Doc3.pdf"  'http://localhost:3000/api/projects/2/task_def_id/1/submission'
    ```

- Response Body: 
    ```json
    {
        "task_id": 1,
        "task_status": "time_exceeded",
        "weeks_can_extend": 2,
        "can_apply_for_extension": true,
        "submitted_before_due": false
    }
    ```
-----------------------------------------------------------

### PUT: Request for a task's documents to be re-processed to recreate the task's PDF
PUT /api/projects/{id}/task_def_id/{task_definition_id}/submission
- URL: ` /api/projects/{id}/task_def_id/{task_definition_id}/submission`
- Method: `PUT`
- Parameter:

    | Parameter          | Description                  | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------------|----------------|-----------|-----------|
    | Username           | Username                     | header         | string    | Yes       |
    | Auth_Token         | Authentication token         | header         | string    | Yes       |
    | id                 | The ID                       | path           | integer   | Yes       |
    | task_definition_id| The task definition ID       | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: XYuRsWH6rEd3kS8F3m6a' 'http://localhost:3000/api/projects/2/task_def_id/1/submission'
    ```
- Response Body: 
    ```json
    {
       "result": "false"
    }   
    ```


------------------------------------------------------------

### GET: Fetches all of the current user's projects
GET /api/projects

- URL: `/api/projects`
- Method: `GET`
- Parameters: 
    
    | Parameter          | Description                                             | Parameter Type | Data Type | Mandatory |
    |--------------------|---------------------------------------------------------|----------------|-----------|-----------|
    | include_inactive   | Include projects for units that are no longer active?   | query          | boolean   | No        |
    | Username           | Username                                                | header         | string    | Yes       |
    | Auth_Token         | Authentication token                                    | header         | string    | Yes       |

- Response: `200 OK`.    

-   Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: bxzSEr86Qgivu5saj6NQ' 'http://localhost:3000/api/projects?include_inactive=true'
    ```

- Response Body:
    ```json
        [
            {
                "id": 2,
                "campus_id": 2,
                "user_id": 24,
                "unit": {
                "code": "COS10001",
                "id": 1,
                "name": "Introduction to Programming",
                "my_role": "Student",
                "start_date": "2024-03-09",
                "end_date": "2024-06-08",
                "active": true
                },
                "target_grade": 3,
                "portfolio_available": false
            },
            {
                "id": 20,
                "campus_id": 3,
                "user_id": 24,
                "unit": {
                "code": "COS20007",
                "id": 2,
                "name": "Object Oriented Programming",
                "my_role": "Student",
                "start_date": "2024-03-09",
                "end_date": "2024-06-08",
                "active": true
                },
                "target_grade": 1,
                "portfolio_available": true
            },
            {
                "id": 39,
                "campus_id": 1,
                "user_id": 24,
                "unit": {
                "code": "COS30046",
                "id": 3,
                "name": "Artificial Intelligence for Games",
                "my_role": "Student",
                "start_date": "2024-03-09",
                "end_date": "2024-06-08",
                "active": true
                },
                "target_grade": 0,
                "portfolio_available": false
            },
            {
                "id": 51,
                "campus_id": 2,
                "user_id": 24,
                "unit": {
                "code": "COS30243",
                "id": 4,
                "name": "Game Programming",
                "my_role": "Student",
                "start_date": "2024-03-09",
                "end_date": "2024-06-08",
                "active": true
                },
                "target_grade": 0,
                "portfolio_available": false
            }
        ]
    ```
------------------------------------------------------------

### POST: Enrol a student in a unit, creating them a project
POST /api/projects

- URL: `/api/projects`
- Method: `POST`
- Parameters:
   
    | Parameter    | Description                        | Parameter Type | Data Type | Mandatory |
    |--------------|------------------------------------|----------------|-----------|-----------|
    | unit_id      | Unit Id                            | formData       | integer   | Yes       |
    | student_num  | Student Number 7 digit code        | formData       | string    | Yes       |
    | campus_id    | Campus this project is part of    | formData       | integer   | Yes       |
    | Username     | Username                           | header         | string    | Yes       |
    | Auth_Token   | Authentication token               | header         | string    | Yes       |

- Response: `201 Created`.

- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: K6qnzaWKTQxSGzsUMUJm' -d 'unit_id=4&student_num=student_6&campus_id=1' 'http://localhost:3000/api/projects'
    ```

- Response Body:
    ```json
        {
            "id": 57,
            "enrolled": true,
            "student": {
                "id": 29,
                "student_id": null,
                "username": "student_6",
                "email": "student_6@doubtfire.com",
                "first_name": "Gracia",
                "last_name": "Heathcote",
                "nickname": "student_6"
            },
            "target_grade": 0,
            "campus_id": 1,
            "compile_portfolio": false,
            "grade": 0,
            "grade_rationale": null,
            "similarity_flag": false,
            "has_portfolio": false,
            "stats": {
                "red_pct": 0,
                "grey_pct": 1,
                "orange_pct": 0,
                "blue_pct": 0,
                "green_pct": 0,
                "order_scale": 0
            }
        }
    ```
---------------------------------------------------------------

### GET: Get project
GET /api/projects/{id}

- URL: `/api/projects/{id}`
- Method: `GET`
- Parameters: 
    
    | Parameter          | Description                                             | Parameter Type | Data Type | Mandatory |
    |--------------------|---------------------------------------------------------|----------------|-----------|-----------|
    | id   | The id of the project to get  | path          | integer   | Yes        |
    | Username           | Username                                                | header         | string    | Yes       |
    | Auth_Token         | Authentication token                                    | header         | string    | Yes       |

- Response: `200 OK`.    

-   Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: n88Za2q7FT8K_E8Hjs-G' 'http://localhost:3000/api/projects/20'
    ```

- Response Body:
    ```json
        {
            "id": 20,
            "campus_id": 3,
            "user_id": 24,
            "unit": {
                "code": "COS20007",
                "id": 2,
                "name": "Object Oriented Programming",
                "my_role": "Student",
                "start_date": "2024-03-09",
                "end_date": "2024-06-08",
                "active": true
            },
            "unit_id": 2,
            "target_grade": 1,
            "submitted_grade": null,
            "portfolio_files": [
                {
                "kind": "document",
                "name": "LearningSummaryReport.pdf",
                "idx": 0
                }
            ],
            "compile_portfolio": false,
            "portfolio_available": true,
            "uses_draft_learning_summary": false,
            "tasks": [
                {
                "id": 312,
                "task_definition_id": 37,
                "status": "complete",
                "due_date": "2024-03-16",
                "submission_date": "2024-04-20",
                "completion_date": "2024-03-16",
                "extensions": 0,
                "times_assessed": 1,
                "quality_pts": -1,
                "include_in_portfolio": true,
                "similarity_flag": false,
                "num_new_comments": 0
                },
                {
                "id": 313,
                "task_definition_id": 49,
                "status": "complete",
                "due_date": "2024-03-16",
                "submission_date": "2024-04-20",
                "completion_date": "2024-03-28",
                "extensions": 0,
                "times_assessed": 1,
                "quality_pts": -1,
                "include_in_portfolio": true,
                "similarity_flag": false,
                "num_new_comments": 0
                },
                {
                "id": 315,
                "task_definition_id": 41,
                "status": "ready_for_feedback",
                "due_date": "2024-04-13",
                "submission_date": "2024-04-20",
                "completion_date": "2024-04-13",
                "extensions": 0,
                "times_assessed": 1,
                "quality_pts": -1,
                "include_in_portfolio": true,
                "similarity_flag": false,
                "num_new_comments": 0
                },
                {
                "id": 314,
                "task_definition_id": 40,
                "status": "demonstrate",
                "due_date": "2024-04-06",
                "submission_date": "2024-04-20",
                "completion_date": "2024-04-05",
                "extensions": 0,
                "times_assessed": 1,
                "quality_pts": -1,
                "include_in_portfolio": true,
                "similarity_flag": false,
                "num_new_comments": 0
                }
            ],
            "tutorial_enrolments": [
                {
                "project_id": 20,
                "tutorial_id": 4
                }
            ],
            "groups": [],
            "task_outcome_alignments": []
        }

    ```

-----------------------------------------------------------

### PUT: Update a project
PUT /api/projects/{id}

- URL: `/api/projects/{id}`
- Method: `PUT`
- Parameters:


    | Parameter         | Description                                       | Parameter Type | Data Type | Mandatory |
    |-------------------|---------------------------------------------------|----------------|-----------|-----------|
    | trigger           | The update trigger                                | formData       | string    | No        |
    | campus_id         | Campus this project is part of, or -1 for no campus | formData     | integer   | No        |
    | enrolled          | Enrol or withdraw this project                    | formData       | boolean   | No        |
    | target_grade      | New target grade                                  | formData       | integer   | No        |
    | submitted_grade   | New submitted grade                               | formData       | integer   | No        |
    | compile_portfolio| Schedule a construction of the portfolio           | formData       | boolean   | No        |
    | grade             | New grade                                         | formData       | integer   | No        |
    | old_grade         | Old grade to check it has not changed...          | formData       | integer   | No        |
    | grade_rationale  | New grade rationale                               | formData       | string    | No        |
    | Username          | (required) Username                               | header         | string    | Yes       |
    | Auth_Token        | (required) Authentication token                   | header         | string    | Yes       |
    | id                | (required)                                          | path           | integer   | Yes       |


- Response: `200 OK`

- Example Request: 
    ``` bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: VzCEC68Bx7D4cBfqQKmp' -d 'target_grade=2' 'http://localhost:3000/api/projects/20'
    ```

- Response Body: 
    ```json
        {
            "campus_id": 3,
            "target_grade": 2,
            "submitted_grade": null,
            "compile_portfolio": false,
            "portfolio_available": true,
            "uses_draft_learning_summary": false
        }
    ```



------------------------------------------------------------

### PUT: Assess an extension for a task
PUT /api/projects/{project_id}/task_def_id/{task_definition_id}/assess_extension/{task_comment_id}

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/assess_extension/{task_comment_id}`
- Method: `PUT`
- Parameter: 

    | Parameter          | Description                        | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------------------|----------------|-----------|-----------|
    | granted            | Assess an extension                | formData       | boolean   |   Yes        |
    | Username           | Username                           | header         | string    | Yes       |
    | Auth_Token         | Authentication token               | header         | string    | Yes       |
    | project_id         | The ID of the project              | path           | integer   |   Yes        |
    | task_definition_id | The ID of the task definition      | path           | integer   |      Yes     |
    | task_comment_id    | The ID of the task comment         | path           | integer   |         Yes  |


- Response: `200 OK`
- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: FUfGuoreoWhJTVZexwbb' -d 'granted=true' 'http://localhost:3000/api/projects/2/task_def_id/1/assess_extension/957'
    ```
- Response Body:
    ```json
    {
        "assessment_result": "extension_granted",
        "message": "Extension successfully granted for the task."
    }
    ```


-------------------------------------------------------------
### POST: Request an extension for a task
POST /api/projects/{project_id}/task_def_id/{task_definition_id}/request_extension

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/request_extension`
- Method: `POST`
- Parameter:

    | Parameter          | Description                 | Parameter Type | Data Type | Mandatory |
    |--------------------|-----------------------------|----------------|-----------|-----------|
    | comment            | The details of the request | formData       | string    |      Yes   |
    | weeks_requested    | The details of the request | formData       | integer   |     Yes    |
    | Username           | Username                    | header         | string    | Yes       |
    | Auth_Token         | Authentication token        | header         | string    | Yes       |
    | project_id         | The ID                      | path           | integer   |  Yes      |
    | task_definition_id | The task definition ID      | path           | integer   |   Yes     |


- Response: `201`
- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: XYuRsWH6rEd3kS8F3m6a' -d 'comment=Need%20extension%20&weeks_requested=2' 'http://localhost:3000/api/projects/2/task_def_id/1/request_extension'
    ```
- Response Body:
    ```json
    {
        "id": 956,
        "comment": "Need extension ",
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
        "created_at": "2024-05-16T09:47:23.006Z",
        "recipient_read_time": "2024-05-16T09:47:23.344Z",
        "granted": true,
        "assessed": true,
        "date_assessed": "2024-05-16T09:47:23.262Z",
        "weeks_requested": 2,
        "extension_response": "Time extended to Tue Apr  2",
        "task_status": "complete"
    }
    ```
---------------------------------------------------
### POST: Reply to a discussion comment of a task
POST /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{task_comment_id}/discussion_comment/reply

- URL:`/api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{task_comment_id}/discussion_comment/reply`
- Method: `POST`
- Parameter:


    | Parameter          | Description                  | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------------|----------------|-----------|-----------|
    | attachment         | discussion reply.            | formData       | file      | Yes       |
    | Username           | Username                     | header         | string    | Yes       |
    | Auth_Token         | Authentication token         | header         | string    | Yes       |
    | project_id         | The ID of the project        | path           | integer   | Yes       |
    | task_definition_id | The ID of the task definition| path           | integer   | Yes       |
    | task_comment_id    | The ID of the task comment   | path           | integer   | Yes       |

- Response:
- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: text/error' --header 'Username: student_1' --header 'Auth_Token: C3pxAcHZje9SR8-NtzUj' -F attachment=@"1.1P submission.pdf"  'http://localhost:3000/api/projects/2/task_def_id/1/comments/957/discussion_comment/reply'

    ```
- Response Body:
    ```json
    {
        "message": "Discussion reply added successfully."
    }
    ```
----------------------------------------------------------

### GET: Get a discussion comment student response
GET /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{task_comment_id}/discussion_comment/response

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{task_comment_id}/discussion_comment/response`
- Method: `GET`
- Parameter:
  
    | Parameter        | Description                                                 | Parameter Type | Data Type | Mandatory |
    |------------------|-------------------------------------------------------------|----------------|-----------|-----------|
    | as_attachment    | Whether or not to download file as attachment. Default is false. | query          | boolean   |           |
    | Username         | Username                                                    | header         | string    | Yes       |
    | Auth_Token       | Authentication token                                        | header         | string    | Yes       |
    | project_id       | The ID of the project                                       | path           | integer   | Yes       |
    | task_definition_id | The ID of the task definition                               | path           | integer   | Yes       |
    | task_comment_id  | The ID of the task comment                                  | path           | integer   | Yes       |

- Response: `200 OK`
- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: ot4QoBX2oJff2zPbo56h' 'http://localhost:3000/api/projects/2/task_def_id/1/comments/957/discussion_comment/response?as_attachment=true'
    ```
- Response Body:
    ```
    Download discussion file
    ```
-----------------------------------------------------
### GET: Get a discussion comment prompt
GET /api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{task_comment_id}/discussion_comment/prompt_number/{prompt_number}

- URL:`/api/projects/{project_id}/task_def_id/{task_definition_id}/comments/{task_comment_id}/discussion_comment/prompt_number/{prompt_number}`
- Method: `GET`
- Parameter:

    | Parameter        | Description                                                 | Parameter Type | Data Type | Mandatory |
    |------------------|-------------------------------------------------------------|----------------|-----------|-----------|
    | as_attachment    | Whether or not to download file as attachment. Default is false. | query          | boolean   |           |
    | Username         | Username                                                    | header         | string    | Yes       |
    | Auth_Token       | Authentication token                                        | header         | string    | Yes       |
    | project_id       | The ID of the project                                       | path           | integer   | Yes       |
    | task_definition_id | The ID of the task definition                               | path           | integer   | Yes       |
    | task_comment_id  | The ID of the task comment                                  | path           | integer   | Yes       |
    | prompt_number    | The number of the prompt                                    | path           | integer   | Yes       |


- Response: `200 OK`
- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: ot4QoBX2oJff2zPbo56h' 'http://localhost:3000/api/projects/2/task_def_id/1/comments/957/discussion_comment/prompt_number/1?as_attachment=true'
    ```
- Response Body:
    ```
    Download prompt file
    ```

---------------------------------------------------
### POST: Add a new discussion comment to a task
POST /api/projects/{project_id}/task_def_id/{task_definition_id}/discussion_comments

- URL: `/api/projects/{project_id}/task_def_id/{task_definition_id}/discussion_comments`
- Method: `POST`
- Parameter: 


    | Parameter          | Description                              | Parameter Type | Data Type | Mandatory |
    |--------------------|------------------------------------------|----------------|-----------|-----------|
    | attachments        | Array of audio prompts                   | formData       | Array[string] | Yes       |
    | Username           | Username                                 | header         | string    | Yes       |
    | Auth_Token         | Authentication token                     | header         | string    | Yes       |
    | project_id         | The ID of the project                    | path           | integer   | Yes       |
    | task_definition_id | The ID of the task definition            | path           | integer   | Yes       |


- Response:
- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: text/error' --header 'Username: atutor' --header 'Auth_Token: jazwuiHGdqUCM3s_nMzw' -d 'attachments=test' 'http://localhost:3000/api/projects/2/task_def_id/1/discussion_comments'
    ```
- Response Body:
    ```json
    {
        "message": "Discussion comment added successfully.",
        "comment_id": 1234,
        "task_id": 5678,
        "task_definition_id": 91011
    }
    ```
-------------------------------------------------------------