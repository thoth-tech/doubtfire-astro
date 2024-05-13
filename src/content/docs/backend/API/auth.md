---
title: Doubtfire API Documentation
---

# API: Auth
auth : Operations about auth 

This markdown document provides detailed documentation for the "auth" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl

This "auth" API has the following operations.
- **DELETE** /api/auth
- **POST** /api/auth
- **PUT** /api/auth
- **GET** /api/auth/signout_url
- **GET** /api/auth/method

## Detail of Operations related to auth.

### DELETE: Deletes authentication.


- URL: `/api/auth`
- Method: `DELETE`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    
- Response:
  - `204 No Content`: Authentication deleted successfully.

- Example Request:
  ```bash
  curl -X DELETE --header 'Accept: application/json' --header 'username: student_1' --header 'auth_token: RbYVL1screzs9QGbAkd' 'http://localhost:3000/api/auth' curl -X DELETE http://doubtfire.com/api/auth
  ```

### POST: Sign in 

- URL: `/api/auth`
- Method:  `POST`
- Parameters: Authentication data
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username |User username | formData | string |Yes|
    |password| User password | formData | string |Yes|
    |remember| User has requested to remember login | formData | boolean | |


- Response:
`201 Created`
- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' -d 'username=student_1&password=password&remember=false' 'http://localhost:3000/api/auth'
    ```

- Response body:
    ```json
    {
    "user": {
        "id": 24,
        "student_id": null,
        "email": "student_1@doubtfire.com",
        "first_name": "Layla",
        "last_name": "Kihn",
        "username": "student_1",
        "nickname": "student_1",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Student"
    },
    "auth_token": "zCQZnhmXzqhNzaxw17Qx"
    }
    ```

### PUT: Allow tokens to be updated

- URL: `/api/auth`
- Method:  `PUT`
- Parameters: Authentication data
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username |User username | formData | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |remember| User has requested to remember login | formData | boolean | |


- Response:
`201 Created`
- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'username: student_1' --header 'auth_token: zCQZnhmXzqhNzaxw17Qx' -d 'remember=false' 'http://localhost:3000/api/auth'
    ```
- Response body:
    ```json
    {
        "auth_token": "zCQZnhmXzqhNzaxw17Qx"
    }
    ```

### GET: Authentication signout URL
GET /api/auth/signout_url

- URL: `/api/auth/signout_url`
- Method: `GET`
- Parameters: None
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/auth/signout_url'
    ```
- Response body: 
    ```json
    {
        "auth_signout_url": null
    }
    ```


### GET: Authentication method configuration
GET /api/auth/method

- URL: `/api/auth/method`
- Method: `GET`
- Parameters: None
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/auth/method'
    ```
- Response body: 
    ```json
    {
        "method": "database",
        "redirect_to": null
    }
    ```
