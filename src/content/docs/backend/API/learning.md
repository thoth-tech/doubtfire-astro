---
title: Doubtfire API
---

# List of Doubtfire

# API: Units - Learning Alignments

Units : Operations about Units

This markdown document provides detailed documentation for the "learning alignments" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "Units" API page has the following operations.

- **GET** /api/units/{unit_id}/learning_alignments/class_details
- **GET** /api/units/{unit_id}/learning_alignments/class_stats
- **DELETE** /api/units/{unit_id}/learning_alignments/{id}
- **PUT** /api/units/{unit_id}/learning_alignments/{id}
- **GET** /api/units/{unit_id}/learning_alignments
- **POST** /api/units/{unit_id}/learning_alignments
- **GET** /api/units/{unit_id}/learning_alignments/csv
- **POST** /api/units/{unit_id}/learning_alignments/csv

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
----------------------------------------------------------------