---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Units (Page 1)
units : Operations about units

This markdown document provides detailed documentation for the "units" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "units" API page has the following operations (**_17 operations_**).

- **GET** /api/units/{id}/stats/task_completion_stats
- **GET** /api/units/{id}/stats/task_status_pct
- **GET** /api/units/{id}/stats/student_target_grade
- **GET** /api/units/{id}/grades
- **GET** /api/units/{id}/tasks/inbox
- **GET** /api/units/{id}/feedback
- **POST** /api/units/{id}/rollover
- **GET** /api/units
- **POST** /api/units
- **GET** /api/units/{id}
- **PUT** /api/units/{id}
- **DELETE** /api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}
- **POST** /api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}
- **GET** /api/units/{unit_id}/group_sets/{id}/groups
- **DELETE** /api/units/{unit_id}/group_sets/{id}
- **PUT** /api/units/{unit_id}/group_sets/{id}
- **POST** /api/units/{unit_id}/group_sets


----------------------------------------------------------------------


### GET: Download stats related to the number of completed tasks
GET /api/units/{id}/stats/task_completion_stats

- URL: `/api/units/{id}/stats/task_completion_stats`
- Method: `GET` 
- Parameter: 

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/stats/task_completion_stats'
	```
- Response Body:
	```json
    {
        "unit": {
            "median": 13,
            "lower": 12,
            "upper": 17,
            "min": 2,
            "max": 19
        },
        "tutorial": {
            "1": {
            "median": 11,
            "lower": 2,
            "upper": 13,
            "min": 2,
            "max": 13
            },
            "3": {
            "median": 16,
            "lower": 13,
            "upper": 17,
            "min": 12,
            "max": 17
            }
        },
        "grade": {
            "0": {
            "median": 11,
            "lower": 8,
            "upper": 11,
            "min": 8,
            "max": 11
            },
            "1": {
            "median": 17,
            "lower": 13,
            "upper": 17,
            "min": 13,
            "max": 17
            },
            "2": {
            "median": 7.5,
            "lower": 2,
            "upper": 13,
            "min": 2,
            "max": 13
            },
            "3": {
            "median": 13,
            "lower": 13,
            "upper": 17,
            "min": 2,
            "max": 19
            }
        }
    }

	```
------------------------------------------------------------------------

### GET: Download stats related to the status of students with tasks
GET /api/units/{id}/stats/task_status_pct

- URL: `/api/units/{id}/stats/task_status_pct`
- Method: `GET` 
- Parameter:

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/stats/task_status_pct'
	```
- Response Body:
	```json
    {
        "1": {
            "1": [
            {
                "tutorial_stream_id": null,
                "status": "complete",
                "num": 4
            },
            {
                "tutorial_stream_id": null,
                "status": "redo",
                "num": 1
            },
            {
                "tutorial_stream_id": null,
                "status": "demonstrate",
                "num": 1
            }
            ],
        }
    }

-------------------------------------------------------------------

### GET: Download the stats related to the number of students aiming for each grade
GET /api/units/{id}/stats/student_target_grade

- URL: `/api/units/{id}/stats/student_target_grade`
- Method: `GET` 
- Parameter:

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/stats/student_target_grade'
	```
- Response Body:
	```json
    [
        {
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "grade": 0,
            "num": 1
        },
        {
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "grade": 1,
            "num": 1
        },
        {
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "grade": 2,
            "num": 1
        },
        {
            "tutorial_id": null,
            "tutorial_stream_id": null,
            "grade": 3,
            "num": 3
        },
        {
            "tutorial_id": 1,
            "tutorial_stream_id": 4,
            "grade": 0,
            "num": 2
        },
        {
            "tutorial_id": 1,
            "tutorial_stream_id": 4,
            "grade": 1,
            "num": 1
        },
        {
            "tutorial_id": 1,
            "tutorial_stream_id": 4,
            "grade": 2,
            "num": 1
        },
        {
            "tutorial_id": 1,
            "tutorial_stream_id": 4,
            "grade": 3,
            "num": 2
        },
        {
            "tutorial_id": 3,
            "tutorial_stream_id": 3,
            "grade": 0,
            "num": 1
        },
        {
            "tutorial_id": 3,
            "tutorial_stream_id": 3,
            "grade": 1,
            "num": 1
        },
        {
            "tutorial_id": 3,
            "tutorial_stream_id": 3,
            "grade": 3,
            "num": 4
        }
   ]
	```
-------------------------------------------------------------------------

### GET: Download the grades for a unit
GET /api/units/{id}/grades

- URL: `/api/units/{id}/grades`
- Method: `GET` 
- Parameter:

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |


- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/grades'
	```
- Response Body:
	```
    Download grades
	```
-----------------------------------------------------------------------------

### GET: Download the tasks that should be listed under the task inbox
GET /api/units/{id}/tasks/inbox

- URL: `/api/units/{id}/tasks/inbox`
- Method: `GET` 
- Parameter:

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: xpx2aQkGKtgDsX4r-LY1' 'http://localhost:3000/api/units/1/tasks/inbox'
	```
- Response Body:
	```json
    [
        {
            "id": 7,
            "project_id": 1,
            "task_definition_id": 5,
            "tutorial_id": null,
            "status": "discuss",
            "completion_date": "2024-03-25",
            "submission_date": "2024-04-20T10:56:17.318Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 1,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 8,
            "project_id": 1,
            "task_definition_id": 6,
            "tutorial_id": null,
            "status": "ready_for_feedback",
            "completion_date": "2024-03-26",
            "submission_date": "2024-04-20T10:56:17.627Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 0,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 10,
            "project_id": 1,
            "task_definition_id": 8,
            "tutorial_id": null,
            "status": "ready_for_feedback",
            "completion_date": "2024-03-28",
            "submission_date": "2024-04-20T10:56:18.175Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 1,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 11,
            "project_id": 1,
            "task_definition_id": 9,
            "tutorial_id": null,
            "status": "ready_for_feedback",
            "completion_date": "2024-03-31",
            "submission_date": "2024-04-20T10:56:18.510Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": 0,
            "num_new_comments": 1,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 12,
            "project_id": 2,
            "task_definition_id": 1,
            "tutorial_id": null,
            "status": "complete",
            "completion_date": "2024-03-22",
            "submission_date": "2024-04-20T10:56:18.978Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 1,
            "similarity_flag": true,
            "pinned": 0,
            "has_extensions": 0
        },
    ]
	```

---------------------------------------------------------------

### GET: Download the tasks that are awaiting feedback for a unit
GET /api/units/{id}/feedback


- URL: `/api/units/{id}/feedback`
- Method: `GET` 
- Parameter:
    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: xpx2aQkGKtgDsX4r-LY1' 'http://localhost:3000/api/units/1/feedback'
	```
- Response Body:
	```json
    [
        {
            "id": 77,
            "project_id": 6,
            "task_definition_id": 1,
            "tutorial_id": null,
            "status": "redo",
            "completion_date": null,
            "submission_date": "2024-04-20T10:58:04.345Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 0,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 3,
            "project_id": 1,
            "task_definition_id": 1,
            "tutorial_id": null,
            "status": "demonstrate",
            "completion_date": "2024-03-18",
            "submission_date": "2024-04-20T10:56:15.653Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 0,
            "similarity_flag": true,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 79,
            "project_id": 6,
            "task_definition_id": 3,
            "tutorial_id": null,
            "status": "discuss",
            "completion_date": "2024-03-20",
            "submission_date": "2024-04-20T10:58:04.866Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 1,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
        {
            "id": 5,
            "project_id": 1,
            "task_definition_id": 3,
            "tutorial_id": null,
            "status": "demonstrate",
            "completion_date": "2024-03-25",
            "submission_date": "2024-04-20T10:56:16.843Z",
            "times_assessed": 1,
            "grade": null,
            "quality_pts": -1,
            "num_new_comments": 0,
            "similarity_flag": false,
            "pinned": 0,
            "has_extensions": 0
        },
    ]
	```
-------------------------------------------------------------------

### POST: Rollover unit
POST /api/units/{id}/rollover

- URL: `/api/units/{id}/rollover`
- Method: `POST` 
- Parameter:

    | Parameter           | Description            | Parameter Type | Data Type | Mandatory |
    |---------------------|------------------------|----------------|-----------|-----------|
    | teaching_period_id  | The teaching period id | formData       | string    | Yes       |
    | start_date          | The start date         | formData       | string    |           |
    | end_date            | The end date           | formData       | string    |           |
    | Username            | Username               | header         | string    | Yes       |
    | Auth_Token          | Authentication token   | header         | string    | Yes       |
    | id                  | The project id         | path           | integer   | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: DCj-W7zLU3RX6qazApjQ' -d 'teaching_period_id=1' 'http://localhost:3000/api/units/1/rollover'
	```
- Response Body:
	```json
    {
        "code": "COS10001",
        "id": 5,
        "name": "Introduction to Programming",
        "my_role": "Admin",
        "main_convenor_id": 17,
        "description": "illo quas voluptatem ea tempore aperiam sapiente cum harum tenetur vitae",
        "teaching_period_id": 1,
        "start_date": "2018-03-05",
        "end_date": "2018-05-25",
        "active": true,
        "overseer_image_id": null,
        "assessment_enabled": true,
        "auto_apply_extension_before_deadline": true,
        "send_notifications": true,
        "enable_sync_enrolments": true,
        "enable_sync_timetable": true,
        "draft_task_definition_id": null,
        "allow_student_extension_requests": true,
        "extension_weeks_on_resubmit_request": 1,
        "allow_student_change_tutorial": true,
        "ilos": [
            {
            "id": 8,
            "ilo_number": 4,
            "abbreviation": "DECOMP",
            "name": "Functional Decomposition",
            "description": "Use modular and functional decomposition to break problems down functionally, represent the resulting structures diagrammatically, and implement these structures in code as functions and procedures.\r\n"
            },
            {
            "id": 9,
            "ilo_number": 3,
            "abbreviation": "PROG",
            "name": "Program",
            "description": "Construct small programs, using the programming languages covered, that include the use of arrays, functions and procedures, parameter passing with call by value and call by reference, custom data types, and pointers.\r\n"
            },
            {
            "id": 10,
            "ilo_number": 2,
            "abbreviation": "PRIN",
            "name": "Structured Programming",
            "description": "Describe the principles of structured programming, and relate these to the syntactical elements of the programming language used and the way programs are developed.\r\n"
            },
            ]
    }
	```

-----------------------------------------------------------------------------------------------------

### GET: Get units related to the current user for admin purposes
GET /api/units

- URL: `/api/units`
- Method: `GET` 
- Parameter:

    | Parameter           | Description                      | Parameter Type | Data Type | Mandatory |
    |---------------------|----------------------------------|----------------|-----------|-----------|
    | include_in_active   | Include units that are not active| query          | boolean   |           |
    | Username            | Username                         | header         | string    | Yes       |
    | Auth_Token          | Authentication token             | header         | string    | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: DCj-W7zLU3RX6qazApjQ' 'http://localhost:3000/api/units?include_in_active=true'
	```
- Response Body:
	```json
    [
        {
            "code": "COS10001",
            "id": 1,
            "name": "Introduction to Programming",
            "my_role": "Admin",
            "main_convenor_user_id": 2,
            "description": "illo quas voluptatem ea tempore aperiam sapiente cum harum tenetur vitae",
            "start_date": "2024-03-09",
            "end_date": "2024-06-08",
            "active": true
        },
        {
            "code": "COS20007",
            "id": 2,
            "name": "Object Oriented Programming",
            "my_role": "Admin",
            "main_convenor_user_id": 2,
            "description": "laudantium dolores rerum tenetur sint aut distinctio velit magni quasi",
            "start_date": "2024-03-09",
            "end_date": "2024-06-08",
            "active": true
        },
        {
            "code": "COS30046",
            "id": 3,
            "name": "Artificial Intelligence for Games",
            "my_role": "Admin",
            "main_convenor_user_id": 3,
            "description": "est laboriosam repellat eos numquam iusto cupiditate praesentium corporis et eligendi pariatur",
            "start_date": "2024-03-09",
            "end_date": "2024-06-08",
            "active": true
        },
        {
            "code": "COS30243",
            "id": 4,
            "name": "Game Programming",
            "my_role": "Admin",
            "main_convenor_user_id": 3,
            "description": "omnis delectus perferendis earum culpa voluptate nesciunt fugiat quam dicta et eius ut dignissimos",
            "start_date": "2024-03-09",
            "end_date": "2024-06-08",
            "active": true
        },
        {
            "code": "COS10001",
            "id": 5,
            "name": "Introduction to Programming",
            "my_role": "Admin",
            "main_convenor_user_id": 2,
            "description": "illo quas voluptatem ea tempore aperiam sapiente cum harum tenetur vitae",
            "teaching_period_id": 1,
            "start_date": "2018-03-05",
            "end_date": "2018-05-25",
            "active": true
        }
    ]
	```

-----------------------------------------------------------------------------------------------

### POST: Create Unit
POST /api/units


- URL: `/api/units`
- Method: `POST` 
- Parameter:

    | Parameter                                       | Description                                                                    | Parameter Type | Data Type | Mandatory |
    |-------------------------------------------------|--------------------------------------------------------------------------------|----------------|-----------|-----------|
    | unit[name]                                      | The name of the unit                                                           | formData       | string    | Yes       |
    | unit[code]                                      | The code of the unit                                                           | formData       | string    | Yes       |
    | unit[description]                               | The description of the unit                                                    | formData       | string    | No        |
    | unit[active]                                    | Indicates if the unit is active                                                | formData       | boolean   | Yes       |
    | unit[teaching_period_id]                        | The ID of the teaching period                                                  | formData       | integer   | Yes       |
    | unit[start_date]                                | The start date of the unit                                                     | formData       | date      | No        |
    | unit[end_date]                                  | The end date of the unit                                                       | formData       | date      | No        |
    | unit[main_convenor_user_id]                     | The user ID of the main convenor                                               | formData       | integer   | Yes       |
    | unit[auto_apply_extension_before_deadline]      | Indicates if extensions before the deadline should be automatically applied    | formData       | boolean   | No        |
    | unit[send_notifications]                        | Indicates if emails should be sent on updates each week                        | formData       | boolean   | No        |
    | unit[enable_sync_timetable]                     | Sync to timetable automatically if supported by deployment                     | formData       | boolean   | No        |
    | unit[enable_sync_enrolments]                    | Sync student enrolments automatically if supported by deployment               | formData       | boolean   | No        |
    | unit[allow_student_extension_requests]          | Can turn on/off student extension requests                                     | formData       | boolean   | No        |
    | unit[extension_weeks_on_resubmit_request]       | Determines the number of weeks extension on a resubmit request                 | formData       | integer   | No        |
    | unit[portfolio_auto_generation_date]            | Indicates a date where student portfolio will automatically compile            | formData       | date      | No        |
    | unit[allow_student_change_tutorial]             | Can turn on/off student ability to change tutorials                            | formData       | boolean   | No        |
    | Username                                        | Username                                                                       | header         | string    | Yes       |
    | Auth_Token                                      | Authentication token                                                           | header         | string    | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: DCj-W7zLU3RX6qazApjQ' -d 'unit%5Bname%5D=Test%20unit&unit%5Bcode%5D=COS11115&unit%5Bactive%5D=true&unit%5Bteaching_period_id%5D=1&unit%5Bmain_convenor_user_id%5D=2&unit%5Bauto_apply_extension_before_deadline%5D=true&unit%5Bsend_notifications%5D=true&unit%5Benable_sync_timetable%5D=true&unit%5Benable_sync_enrolments%5D=true&unit%5Ballow_student_extension_requests%5D=true&unit%5Bextension_weeks_on_resubmit_request%5D=1&unit%5Ballow_student_change_tutorial%5D=true' 'http://localhost:3000/api/units'
	```
- Response Body:
	```json
    {
        "code": "COS11115",
        "id": 6,
        "name": "Test unit",
        "my_role": "Convenor",
        "main_convenor_id": 18,
        "description": "Test unit",
        "teaching_period_id": 1,
        "start_date": "2018-03-05",
        "end_date": "2018-05-25",
        "active": true,
        "overseer_image_id": null,
        "assessment_enabled": true,
        "auto_apply_extension_before_deadline": true,
        "send_notifications": true,
        "enable_sync_enrolments": true,
        "enable_sync_timetable": true,
        "draft_task_definition_id": null,
        "allow_student_extension_requests": true,
        "extension_weeks_on_resubmit_request": 1,
        "allow_student_change_tutorial": true,
        "ilos": [],
        "tutorial_streams": [],
        "staff": [
            {
            "id": 18,
            "role": "Convenor",
            "user": {
                "id": 1,
                "email": "aadmin@doubtfire.com",
                "first_name": "Admin",
                "last_name": "Admin",
                "username": "aadmin",
                "nickname": "Admin"
            }
            }
        ],
        "tutorials": [],
        "task_definitions": [],
        "task_outcome_alignments": [],
        "group_sets": [],
        "groups": []
    }
	```
-----------------------------------------------------------------------------------------

### GET: Get a unit's details
GET /api/units/{id}

- URL: `/api/units/{id}`
- Method: `GET` 
- Parameter:

    | Parameter   | Description            | Parameter Type | Data Type | Mandatory |
    |-------------|------------------------|----------------|-----------|-----------|
    | Username    | Username               | header         | string    | Yes       |
    | Auth_Token  | Authentication token   | header         | string    | Yes       |
    | id          | The project id         | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: DCj-W7zLU3RX6qazApjQ' 'http://localhost:3000/api/units/1'
	```
- Response Body:
	```json
    {
        "code": "COS10001",
        "id": 1,
        "name": "Introduction to Programming",
        "my_role": "Admin",
        "main_convenor_id": 1,
        "description": "illo quas voluptatem ea tempore aperiam sapiente cum harum tenetur vitae",
        "start_date": "2024-03-09",
        "end_date": "2024-06-08",
        "active": true,
        "overseer_image_id": null,
        "assessment_enabled": true,
        "auto_apply_extension_before_deadline": true,
        "send_notifications": true,
        "enable_sync_enrolments": true,
        "enable_sync_timetable": true,
        "draft_task_definition_id": null,
        "allow_student_extension_requests": true,
        "extension_weeks_on_resubmit_request": 1,
        "allow_student_change_tutorial": true,
        "ilos": [
        {
        "id": 1,
        "ilo_number": 4,
        "abbreviation": "DECOMP",
        "name": "Functional Decomposition",
        "description": "Use modular and functional decomposition to break problems down functionally, represent the resulting structures diagrammatically, and implement these structures in code as functions and procedures.\r\n"
        },]
        "tutorial_streams": [
        {
        "id": 1,
        "name": "Workshop-1",
        "abbreviation": "wrkshop-1",
        "activity_type": "wrkshop"
        },]
        "task_definitions": [
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
            },]
        }]
    }
    
	```
--------------------------------------------------------------------------------------

### PUT: Update unit
PUT /api/units/{id}

- URL: `/api/units/{id}`
- Method: `PUT` 
- Parameter:

| Parameter                                        | Description                                                                           | Parameter Type | Data Type | Mandatory |
|--------------------------------------------------|---------------------------------------------------------------------------------------|----------------|-----------|-----------|
| id                                               | The unit id to update                                                                 | path           | integer   | Yes       |
| unit[name]                                       | Test unit_ Introduction to Programming                                                | formData       | string    | Yes       |
| unit[code]                                       |                                                                                       | formData       | string    | No        |
| unit[description]                                |                                                                                       | formData       | string    | No        |
| unit[active]                                     |                                                                                       | formData       | boolean   | No        |
| unit[teaching_period_id]                         |                                                                                       | formData       | integer   | No        |
| unit[start_date]                                 |                                                                                       | formData       | date      | No        |
| unit[end_date]                                   |                                                                                       | formData       | date      | No        |
| unit[main_convenor_id]                           |                                                                                       | formData       | integer   | No        |
| unit[auto_apply_extension_before_deadline]       | Indicates if extensions before the deadline should be automatically applied           | formData       | boolean   | No        |
| unit[send_notifications]                         | Indicates if emails should be sent on updates each week                               | formData       | boolean   | No        |
| unit[enable_sync_timetable]                      | Sync to timetable automatically if supported by deployment                            | formData       | boolean   | No        |
| unit[enable_sync_enrolments]                     | Sync student enrolments automatically if supported by deployment                      | formData       | boolean   | No        |
| unit[draft_task_definition_id]                   | Indicates the ID of the task definition used as the "draft learning summary task"      | formData       | integer   | No        |
| unit[portfolio_auto_generation_date]             | Indicates a date where student portfolio will automatically compile                   | formData       | date      | No        |
| unit[allow_student_extension_requests]           | Can turn on/off student extension requests                                            | formData       | boolean   | No        |
| unit[allow_student_change_tutorial]              | Can turn on/off student ability to change tutorials                                   | formData       | boolean   | No        |
| unit[extension_weeks_on_resubmit_request]        | Determines the number of weeks extension on a resubmit request                        | formData       | integer   | No        |
| unit[overseer_image_id]                          | The id of the docker image used with                                                  | formData       | integer   | No        |
| unit [assessment_enabled] | |formData | boolean | No |
|Username | User username | header| string| Yes|
|Auth_token| Authentication token | header| string | Yes|

- Response: `200`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: DCj-W7zLU3RX6qazApjQ' -d 'unit%5Bname%5D=Test%20unit_%20Introduction%20to%20Programming&unit%5Bassessment_enabled%5D=true' 'http://localhost:3000/api/units/1'
	```
- Response Body:
	```json
    {
        "name": "Test unit_ Introduction to Programming",
        "assessment_enabled": true
    }
	```
----------------------------------------------------------------------------------------
### DELETE: Delete an enrolment in the tutorial 
DELETE /api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}

- URL: `/api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}`
- Method: `DELETE` 
- Parameter:

    | Parameter          | Description            | Parameter Type | Data Type |Mandatory|
    |--------------------|------------------------|----------------|-----------|---------|
    | Username           | Username               | header         | string    |Yes      |
    | Auth_Token         | Authentication token   | header         | string    |Yes      |
    | unit_id            |           | path           | integer   |Yes      |
    | tutorial_abbr      |             | path           | integer   |Yes      |
    | project_id         |                        | path           | integer   |Yes      |


- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: _RjGmj9uZ1yDNLJy-rLa' 'http://localhost:3000/api/units/1/tutorials/LA1-01/enrolments/1'
	```
- Response Body:
	```
    true
	```
----------------------------------------------------------------------------------

### POST: Enrol project in a tutorial
POST /api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}

- URL: `/api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}`
- Method: `POST` 
- Parameter:


    | Parameter          | Description            | Parameter Type | Data Type |Mandatory|
    |--------------------|------------------------|----------------|-----------|---------|
    | Username           | Username               | header         | string    |Yes      |
    | Auth_Token         | Authentication token   | header         | string    |Yes      |
    | unit_id            |              | path           | integer   |Yes      |
    | tutorial_abbr      |              | path           | integer   |Yes      |
    | project_id         |                        | path           | integer   |Yes      |

- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: _RjGmj9uZ1yDNLJy-rLa' 'http://localhost:3000/api/units/1/tutorials/LA1-01/enrolments/1'
	```
- Response Body:
	```json
    {
        "enrolments": [
            {
            "project_id": 1,
            "tutorial_id": 1
            }
        ]
    }
	```
-----------------------------------------------------------------------------------

### GET: Get the groups in a group set
GET /api/units/{unit_id}/group_sets/{id}/groups

- URL: `/api/units/{unit_id}/group_sets/{id}/groups`
- Method: `GET` 
- Parameter:
    
    | Parameter  | Description                        | Parameter Type | Data Type | Mandatory |
    |------------|------------------------------------|----------------|-----------|-----------|
    | Username   | User Username                      | header         | string    | Yes       |
    | Auth_Token | Authentication token               | header         | string    | Yes       |
    | unit_id    |                                    | path           | integer   | Yes       |
    | id         |                                    | path           | integer   | Yes       |

- Response: `200`

- Example Request:
	```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: sWkFmUyHxKDEN_9Qjxjj' 'http://localhost:3000/api/units/1/group_sets/3/groups'
	```
- Response Body:
	```
    []
	```

-------------------------------------------------------------------------
### DELETE: Delete a group set
DELETE /api/units/{unit_id}/group_sets/{id}

- URL: `/api/units/{unit_id}/group_sets/{id}`
- Method: `DELETE` 
- Parameter:


    | Parameter  | Description                                         | Parameter Type | Data Type | Mandatory |
    |------------|-----------------------------------------------------|----------------|-----------|-----------|
    | Username   | User Username                                      | header         | string    | Yes       |
    | Auth_Token | Authentication token                               | header         | string    | Yes       |
    | unit_id    |                                                     | path           | integer   | Yes       |
    | id         |                                                     | path           | integer   | Yes       |


- Response: `204`

- Example Request:
	```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5tRKys7u_zJ3ZQ5a4tny' 'http://localhost:3000/api/units/1/group_sets/1'
	```
- Response Body:
	```
    true
	```

-------------------------------------------------------------------------

### PUT: Edits the given group set
PUT /api/units/{unit_id}/group_sets/{id}

- URL: `/api/units/{unit_id}/group_sets/{id}`
- Method: `PUT` 
- Parameter:

    | Parameter                                  | Description                                         | Parameter Type | Data Type | Mandatory |
    |--------------------------------------------|-----------------------------------------------------|----------------|-----------|-----------|
    | id                                         | The group set id to edit                            | path           | integer   | Yes       |
    | group_set[name]                            |                                      | formData       | string    | Yes       |
    | group_set[allow_students_to_create_groups] | Are students allowed to create groups               | formData       | boolean   | No        |
    | group_set[allow_students_to_manage_groups] | Are students allowed to manage their group memberships | formData     | boolean   | No        |
    | group_set[keep_groups_in_same_class]       | Must groups be kept in the one class                | formData       | boolean   | No        |
    | group_set[capacity]                        | Capacity for each group                             | formData       | integer   | No        |
    | group_set[locked]                          | Is this group set locked                            | formData       | boolean   | No        |
    | Username                                   | User Username                                              | header         | string    | Yes       |
    | Auth_Token                                 | Authentication token                                | header         | string    | Yes       |
    | unit_id                                    |                                                     | header         | integer   | Yes       |


- Response: `200`

- Example Request:
	```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5tRKys7u_zJ3ZQ5a4tny' -d 'group_set%5Bname%5D=test_group_test&group_set%5Ballow_students_to_create_groups%5D=true&group_set%5Ballow_students_to_manage_groups%5D=true' 'http://localhost:3000/api/units/1/group_sets/1'
	```
- Response Body:
	```json
    {
        "id": 1,
        "name": "test_group_test",
        "allow_students_to_create_groups": true,
        "allow_students_to_manage_groups": true,
        "keep_groups_in_same_class": false,
        "capacity": null,
        "locked": false
    }
	```

--------------------------------------------------------------------------

### POST: Add a new group set to the given unit
POST /api/units/{unit_id}/group_sets

- URL: `/api/units/{unit_id}/group_sets`
- Method: `POST` 
- Parameter:


    | Parameter                                  | Description                                         | Parameter Type | Data Type | Mandatory |
    |--------------------------------------------|-----------------------------------------------------|----------------|-----------|-----------|
    | unit_id                                    | The unit for the new group set                      | path           | integer   | Yes       |
    | group_set[name]                            |                                                     | formData       | string    | Yes       |
    | group_set[allow_students_to_create_groups] | Are students allowed to create groups               | formData       | boolean   | No        |
    | group_set[allow_students_to_manage_groups] | Are students allowed to manage their group memberships | formData     | boolean   | No        |
    | group_set[keep_groups_in_same_class]       | Must groups be kept in the one class                | formData       | boolean   | No        |
    | group_set[capacity]                        | Capacity for each group                             | formData       | integer   | No        |
    | Username                                   | User Username                                       | header         | string    | Yes       |
    | Auth_Token                                 | Authentication token                                 | header        | string    | Yes       |


- Response: `201`

- Example Request:
	```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5tRKys7u_zJ3ZQ5a4tny' -d 'group_set%5Bname%5D=test_group&group_set%5Ballow_students_to_create_groups%5D=true' 'http://localhost:3000/api/units/1/group_sets'
	```
- Response Body:
	```json
    {
        "id": 1,
        "name": "test_group",
        "allow_students_to_create_groups": true,
        "allow_students_to_manage_groups": true,
        "keep_groups_in_same_class": false,
        "capacity": null,
        "locked": false
    }
	```
---------------------------------------------------------------------------


