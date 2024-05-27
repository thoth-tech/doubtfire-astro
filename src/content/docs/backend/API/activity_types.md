---
title: Doubtfire API Documentation
---

# API: Activity Types 
activity_types : Operations about activity_types
This markdown document provides detailed documentation for the "activity_types" API endpoints including their URLs, methods, parameters, responses, and example requests using curl. 

This "activity_types" API has the following operations.

- **GET**: /api/activity_types
- **POST**: /api/activity_types
- **DELETE**: /api/activity_types/{id}
- **GET**: /api/activity_types/{id}
- **PUT**: /api/activity_types/{id}

## Detail of Operations related to activity types.

### GET activity_types: gets a list of all activity types.
GET /api/activity_types

- URL: `api/activity_types`
- Method: `GET`
- Parameters: None
- Response: `200 OK`

- Example Request:
  ```bash
  curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/activity_types'
  ```

- Response body: 
    ```json
    [
      {
        "id": 1,
        "name": "Practical",
        "abbreviation": "prac"
      },
      {
        "id": 2,
        "name": "Workshop",
        "abbreviation": "wrkshop"
      },
      {
        "id": 3,
        "name": "Class",
        "abbreviation": "cls"
      },
    ]

    ```


### POST activity_types: creates or adds a new activity type
POST/api/activity_types

- URL: `api/activity_types`
- Method: `POST`
- Parameters:

  | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
  |---------------------|-----------------|------------|------------|---|
  | name                | The name of the activity type    | formData| string|Yes|
  |abbreviation         |	The abbreviation for the activity type   | formData| string|Yes|
  |Username | enter the username | header | string |Yes|
  |Auth_Token | Authentication token | header | string |Yes|

- Response:
`201 Created`

- Example Request:
  ```bash 
  curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 9zV37yx2jQ3j8Nsy4MP_' -d 'activity_type%5Bname%5D=Practical1&activity_type%5Babbreviation%5D=prac1' 'http://localhost:3000/api/activity_types'
  ```

- Response Body
  ```json
  {
    "id": 4,
    "name": "Practical1",
    "abbreviation": "prac1"
  }
  ```

### DELETE activity_types: delete an activity type
DELETE /api/activity_types/{id}

- URL: `api/activity_types/{id}`
- Method: `DELETE`
- Parameters:

  | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
  |---------------------|-----------------|------------|------------|-----|
  |Username | enter the username | header | string |Yes|
  |Auth_Token | Authentication token | header | string |Yes|
  |id | | path | integer|Yes|

- Response: 
`204` No Content

- Example request 
  ```bash
  curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5zR37VDdBV6FZvJzABPS' 'http://localhost:3000/api/activity_types/4'
  ```

### GET: Get an activity type details
GET /api/activity_types/{id}

- URL: `api/activity_types/{id}`
- Method: `GET`
- Parameters:

  | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
  |---------------------|-----------------|------------|------------|---|
  |id | | path | integer|Yes|

- Response: 
`200 OK`

- Example request 
  ```bash
  curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/activity_types/3'
  ```
  
- Response Body:
  ```json
  {
    "id": 3,
    "name": "Class",
    "abbreviation": "cls"
  }
  ```


### PUT: Update an activity type
PUT /api/activity_types/{id}

- URL: `api/activity_types/{id}`
- Method: `PUT`
- Parameters:

  | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
  |---------------------|-----------------|------------|------------|-----|
  | activity_type [name]                | The name of the activity type    | formData| string| |
  |activity_type [abbreviation]         |	The abbreviation for the activity type   | formData| string||
  |Username | enter the username | header | string |Yes|
  |Auth_Token | Authentication token | header | string | Yes|
  |id | | path | integer| Yes|

- Response:  `200 OK`

- Example Request
  ```bash
  curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: nHyAVEAsSp25snxiLomP' -d 'activity_type%5Bname%5D=Practical1&activity_type%5Babbreviation%5D=prac1' 'http://localhost:3000/api/activity_types/5'
  ```

- Response Body
  ```json
  {
    "id": 5,
    "name": "Practical1",
    "abbreviation": "prac1"
  }
  ```

