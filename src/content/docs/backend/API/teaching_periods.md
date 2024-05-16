---
title: Doubtfire API 
---

# List of Doubtfire

# API: Teaching period
teaching_period : Operations about teaching_period
This markdown document provides detailed documentation for the "teaching_period" API endpoints including their URLs, methods, parameters, responses, and example requests using curl. 

This "teaching_period" API has the following operations.

- **POST** /api/teaching_periods/{existing_teaching_period_id}/rollover
- **DELETE** /api/teaching_periods/{teaching_period_id}
- **GET** /api/teaching_periods/{id}
- **PUT** /api/teaching_periods/{id}
- **GET** /api/teaching_periods
- **POST** /api/teaching_periods
- **DELETE** /api/teaching_periods/{teaching_period_id}/breaks/{id}
- **PUT** /api/teaching_periods/{teaching_period_id}/breaks/{id}
- **GET** /api/teaching_periods/{teaching_period_id}/breaks
- **POST** /api/teaching_periods/{teaching_period_id}/breaks


## Detail of Operations related to teaching_period.

### POST: Rollover a Teaching Period
POST /api/teaching_periods/{existing_teaching_period_id}/rollover

- URL: `/api/teaching_periods/{existing_teaching_period_id}/rollover`
- Method: `POST`
- Parameters: 
    
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: quNNcGRv8bLteyUXqE6T' -d 'new_teaching_period_id=5&rollover_inactive=true&search_forward=true' 'http://localhost:3000/api/teaching_periods/3/rollover'
    ```
- Response body: 
    ```null   ```
--------------------------------------------------------------------------------

### DELETE: Delete a teaching period
DELETE /api/teaching_periods/{teaching_period_id}

- URL: `/api/teaching_periods/{teaching_period_id}`
- Method: `DELETE`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |teaching_period_id | | path | integer |Yes|
    |id| | path | integer| Yes|
- Response:
`204 `

- Example Request:
    ```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 6NuPzeRAruwgNtHo8V39' 'http://localhost:3000/api/teaching_periods/4'
    ```
- Response body: 
    ```Teaching period deleted ```
-------------------------------------------------------------------
### GET: Get a teaching period's details
GET /api/teaching_periods/{id}

- URL: `/api/teaching_periods/{teaching_period_id}`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id || path | integer |Yes|
   
- Response:
`200 OK`: Get a teaching period's details

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/teaching_periods/1'
    ```
- Response body: 
    ```json
    {
        "id": 1,
        "period": "T1",
        "year": 2018,
        "start_date": "2018-03-05T00:00:00.000Z",
        "end_date": "2018-05-25T00:00:00.000Z",
        "active_until": "2018-06-15T00:00:00.000Z",
        "active": false,
        "breaks": [
            {
            "id": 1,
            "start_date": "2018-03-30",
            "number_of_weeks": 1
            }
        ],
        "units": []
    }
    ```
---------------------------------------------------------------------
### PUT: Update teaching period
PUT /api/teaching_periods/{id}

- URL: `/api/teaching_periods/{id}`
- Method: `PUT`
- Parameters: 

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id| The teaching period id to update| path | integer| Yes|
    |teaching_period[period] |The name of the teaching period| formData | String ||
    |teaching_period[year] |The year of the teaching period| formData | integer ||
    |teaching_period[start_date] |The start date of the teaching period | formData | date ||
    |teaching_period[end_date] |The end date of the teaching period| formData | integer ||
    |teaching_period[active_until] |The teaching period will be active until this date | formData | integer ||
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|


- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: YhcqgVjqxGDmbxvyfk1q' -d 'teaching_period%5Bactive_until%5D=2024-06-15T00%3A00%3A00.000Z' 'http://localhost:3000/api/teaching_periods/4'
    ```
- Response body: 
    ```json
    {
        "id": 4,
        "period": "T1",
        "year": 2024,
        "start_date": "2024-03-05T00:00:00.000Z",
        "end_date": "2024-05-25T00:00:00.000Z",
        "active_until": "2024-06-15T00:00:00.000Z",
        "active": true
    }
    ```

------------------------------------------------------------------------

### GET: Get all the Teaching Periods
GET /api/teaching_periods

- URL: `/api/teaching_periods`
- Method: `GET`
- Parameters: 
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/teaching_periods'
    ```
- Response body: 
    ```json
    [
    {
        "id": 1,
        "period": "T1",
        "year": 2018,
        "start_date": "2018-03-05T00:00:00.000Z",
        "end_date": "2018-05-25T00:00:00.000Z",
        "active_until": "2018-06-15T00:00:00.000Z",
        "active": false
    },
    {
        "id": 2,
        "period": "T2",
        "year": 2018,
        "start_date": "2018-07-09T00:00:00.000Z",
        "end_date": "2018-09-28T00:00:00.000Z",
        "active_until": "2018-10-19T00:00:00.000Z",
        "active": false
    },
    {
        "id": 3,
        "period": "T3",
        "year": 2018,
        "start_date": "2018-11-05T00:00:00.000Z",
        "end_date": "2019-02-01T00:00:00.000Z",
        "active_until": "2019-02-15T00:00:00.000Z",
        "active": false
    }
    ]
    ```
------------------------------------------------------------------------

### POST: Add a Teaching Period
POST /api/teaching_periods

- URL: `/api/teaching_periods`
- Method: `POST`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |teaching_period[period] |The name of the teaching period| formData | String |Yes|
    |teaching_period[year] |The year of the teaching period| formData | integer |Yes|
    |teaching_period[start_date] |The start date of the teaching period | formData | date |Yes|
    |teaching_period[end_date] |The end date of the teaching period| formData | integer |Yes|
    |teaching_period[active_until] |The teaching period will be active until this date | formData | integer |Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|

- Response:
`201 Created`

- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: YhcqgVjqxGDmbxvyfk1q' -d 'teaching_period%5Bperiod%5D=T1&teaching_period%5Byear%5D=2024&teaching_period%5Bstart_date%5D=2024-03-05T00%3A00%3A00.000Z&teaching_period%5Bend_date%5D=2024-05-25T00%3A00%3A00.000Z&teaching_period%5Bactive_until%5D=2024-06-25T00%3A00%3A00.000Z' 'http://localhost:3000/api/teaching_periods'
    ```
- Response body: 
    ```json
    {
        "id": 4,
        "period": "T1",
        "year": 2024,
        "start_date": "2024-03-05T00:00:00.000Z",
        "end_date": "2024-05-25T00:00:00.000Z",
        "active_until": "2024-06-25T00:00:00.000Z",
        "active": true
    }
    ```

------------------------------------------------------------------------

### DELETE: Remove a break from a teaching period
DELETE /api/teaching_periods/{teaching_period_id}/breaks/{id}

- URL: `/api/teaching_periods/{teaching_period_id}/breaks/{id}`
- Method: `DELETE`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |teaching_period_id | | path | integer |Yes|
    |id| | path | integer| Yes|
- Response:
`204 `

- Example Request:
    ```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 6NuPzeRAruwgNtHo8V39' 'http://localhost:3000/api/teaching_periods/4/breaks/4'
    ```
- Response body: 
    ``` true  ```
------------------------------------------------------------------------

### PUT: Update a break in the teaching period
PUT /api/teaching_periods/{teaching_period_id}/breaks/{id}

- URL: `/api/teaching_periods/{teaching_period_id}/breaks/{id}`
- Method: `PUT`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |start_date |The start date of the teaching period | formData | date ||
    |number_of_weeks |Break duration| formData | integer ||
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |teaching_period_id | | path | integer |Yes|
    |id| | path | integer| Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 6NuPzeRAruwgNtHo8V39' -d 'number_of_weeks=2' 'http://localhost:3000/api/teaching_periods/4/breaks/4'
    ```
- Response body: 
    ```json
    {
        "id": 4,
        "start_date": "2024-04-12",
        "number_of_weeks": 2
    }
    ```
-----------------------------------------------------------------------------
### GET: Get all the breaks in the Teaching Period
GET /api/teaching_periods/{teaching_period_id}/breaks

- URL: `/api/teaching_periods/{teaching_period_id}/breaks/{id}`
- Method: `GET`
- Parameters: 
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |teaching_period_id| | path| integer| Yes| 
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: YhcqgVjqxGDmbxvyfk1q' 'http://localhost:3000/api/teaching_periods/1/breaks'
    ```
- Response body: 
    ```json
    [
    {
        "id": 1,
        "start_date": "2018-03-30",
        "number_of_weeks": 1
    }
    ]
    ```
-----------------------------------------------------------------------------
### POST: Add a new break to the teaching period
POST /api/teaching_periods/{teaching_period_id}/breaks

- URL: `/api/teaching_periods/{teaching_period_id}/breaks/{id}`
- Method: `POST`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |start_date |The start date of the break | formData | date |Yes|
    |number_of_weeks |Break duration | formData | integer |Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |teaching_period_id| | path| integer| Yes| 

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: YhcqgVjqxGDmbxvyfk1q' -d 'start_date=2024-04-12T00%3A00%3A00.000Z&number_of_weeks=1' 'http://localhost:3000/api/teaching_periods/4/breaks'
    ```
- Response body: 
    ```json
    {
        "id": 4,
        "start_date": "2024-04-12",
        "number_of_weeks": 1
    }
    ```
