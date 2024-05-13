---
title: Doubtfire API
---
# API: CSV
csv : Operations about csv
This markdown document provides detailed documentation for the "csv" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "csv" API has the following operations.

- **GET** /api/csv/users
- **POST** /api/csv/users
- **GET** /api/csv/units/{id}/tutor_assessments
- **GET** /api/csv/units/{id}/task_completion
- **GET** /api/csv/units/{id}
- **POST** /api/csv/units/{id}
- **POST** /api/csv/units/{id}/withdraw
- **GET** /api/csv/task_definitions
- **POST** /api/csv/task_definitions


## Detail of Operations related to csv.

### GET: Download CSV of all users
GET /api/csv/users

- URL: `/api/csv/users`
- Method: `GET`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
   

- Response:
  - `200 OK`: Download CSV of all users

- Example Request
    ```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: orofzZ7rMY5ivQzat2Kv' 'http://localhost:3000/api/csv/users'
    ```
- Response body:

    `Download users`

-------------------------------------------------------------------

### POST: Upload CSV of users
POST /api/csv/users

- URL: `/api/csv/users`
- Method: `POST`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |file | CSV upload file. | formData | file |Yes|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
   

- Response:
  - `201 OK`: Upload CSV of users

- Example Request
    ```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: orofzZ7rMY5ivQzat2Kv' -F file=@"Book2.xlsx"  'http://localhost:3000/api/csv/users'
    ```
- Response body:

    ```json
    {
        "success": [2],
        "ignored": [],
        "errors": []
    }
    ```
-------------------------------------------------------------

### GET: Download stats related to the number of tasks assessed by each tutor
GET /api/csv/units/{id}/tutor_assessments

- URL: `/api/csv/units/{id}/tutor_assessments`
- Method: `GET`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id| |path|integer|Yes|
- Response:
  - `200 OK`: Download stats related to the number of tasks assessed by each tutor

- Example Request
    ```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: orofzZ7rMY5ivQzat2Kv' 'http://localhost:3000/api/csv/units/1/tutor_assessments'
    ```
- Response body:

    `Download tutor assessments`

-------------------------------------------------------------

### GET: Download CSV of all student tasks in this unit
GET /api/csv/units/{id}/task_completion

- URL: `/api/csv/units/{id}/task_completion`
- Method: `GET`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id| |path|integer|Yes|

- Response:
  - `200 OK`: Download CSV of all students in this unit

- Example Request
    ```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: B34P_wnsuosY1a2SXA3Q' 'http://localhost:3000/api/csv/units/1/task_completion'
    ```
- Response body:

    `Download task completion`

----------------------------------------------------------------

### GET: Download CSV of all students in this unit
GET /api/csv/units/{id}

- URL: `/api/csv/units/{id}`
- Method: `GET`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id| |path|integer|Yes|

- Response:
  - `200 OK`: Download CSV of all students in this unit

- Example Request
    ```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: orofzZ7rMY5ivQzat2Kv' 'http://localhost:3000/api/csv/units/1'
    ```
- Response body:

    `Download1`
---------------------------------------------------------------

### POST: Upload CSV of all the students in a unit
POST /api/csv/units/{id}

- URL: `/api/csv/units/{id}`
- Method: `POST`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |file | CSV upload file. | formData | file |Yes|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id| |path|integer|Yes|

- Response:
  - `201 OK`: Upload CSV of all the students in a unit

- Example Request
    ```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: orofzZ7rMY5ivQzat2Kv' -F file=@"Book2.xlsx"  'http://localhost:3000/api/csv/units/1'
    ```
- Response body:

    ```json
    {
        "success": [],
        "ignored": [],
        "errors": []
    }
    ```
-------------------------------------------------------------

### POST: Upload CSV with the students to un-enrol from the unit
POST /api/csv/units/{id}/withdraw


- URL: `/api/csv/units/{id}/withdraw`
- Method: `POST`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |file | CSV upload file. | formData | file |Yes|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id| |path|integer|Yes|

- Response:
  - `201 OK`: Upload CSV with the students to un-enrol from the unit

- Example Request
    ```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: B34P_wnsuosY1a2SXA3Q' -F file=@"Book2.xlsx"  'http://localhost:3000/api/csv/units/1/withdraw'
    ```
- Response body:

    ```json
    {
        "success": [],
        "ignored": [],
        "errors": []
    }
    ```

---------------------------------------------------------------

### GET: Download CSV of all task definitions for the given unit
GET /api/csv/task_definitions

- URL: `/api/csv/task_definitions`
- Method: `GET`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |unit_id|The unit to download tasks from |query|integer|Yes|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response:
  - `200 OK`: Download CSV of all student tasks in this unit

- Example Request
    ```bash
    curl -X GET --header 'Accept: application/octet-stream' --header 'Username: aadmin' --header 'Auth_Token: orofzZ7rMY5ivQzat2Kv' 'http://localhost:3000/api/csv/units/1/task_completion'
    ```
- Response body:

    `Download task completion`

--------------------------------------------------------------------------

### POST: Upload CSV of task definitions to the provided unit
POST /api/csv/task_definitions

- URL: `/api/csv/task_definitions`
- Method: `POST`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |file | CSV upload file. | formData | file |Yes|
    |unit_id| The unit to upload tasks to |formData|integer|Yes|
    |Username | enter the username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response:
  - `201 OK`: Upload CSV with the students to un-enrol from the unit

- Example Request
    ```bash
    curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: B34P_wnsuosY1a2SXA3Q' -F file=@"Book2.xlsx" -F unit_id=1  'http://localhost:3000/api/csv/task_definitions'
    ```
- Response body:

    ```json
    {
        "success": [],
        "ignored": [],
        "errors": []
    }
    ```
