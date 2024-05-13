---
title: Doubtfire API Documentation
---

# API: Campuses
campuses : Operations about campuses
This markdown document provides detailed documentation for the "campuses" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "campuses" API has the following operations.

- **DELETE** /api/campuses/{id}
- **GET** /api/campuses/{id}
- **PUT** /api/campuses/{id}
- **GET** /api/campuses
- **POST** /api/campuses

## Detail of Operations related to campuses.

### DELETE: Delete a campus.
Delete /api/campuses/{id}
- URL: `/api/campuses/{id}`
- Method: `DELETE`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id | | path | integer|Yes|

- Response: 
        `204 OK`: Campus deleted successfully.

- Example Request:
    ```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/api/campuses/6'
    ```
- Response body: 
    ```
        true
    ```
### GET: fetches a campuses details by ID
GET /api/campuses/{id}

- URL: `/api/campuses/{id}`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id | | path | integer|Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/campuses/4'
    ```
- Response body: 
    ```json
    {
    "id": 4,
    "name": "Geelong_1",
    "mode": "timetable",
    "abbreviation": "gee test1",
    "active": true
    }
    ```

### PUT: Update campus detail for specific ID
PUT /api/campuses/{id}

- URL: `/campuses/{id}`
- Method: `PUT`
- Parameters:

    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |campus[name] | The name of the campus | formData | string |Yes|
    |campus[mode] | This will determine the campus mode | formData | string |Yes|
    |campus[abbreviation] | The abbreviation for the campus | header | string |Yes|
    |campus[active] | Determines whether campus is active | header | string |Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response:  `200 OK`

- Example Request
  ```bash
  curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -d 'campus%5Bname%5D=Geelong_1&campus%5Bmode%5D=automatic&campus%5Bactive%5D=true' 'http://localhost:3000/api/campuses/4'
  ```

- Response Body
  ```json
    {
    "id": 4,
    "name": "Geelong_1",
    "mode": "automatic",
    "abbreviation": "gee test1",
    "active": true
    }
  ```




### GET: fetches a details of all campuses
GET /api/campuses

- URL: `/api/campuses`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id | | path | integer|Yes|
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/campuses'
    ```
- Response body: 
    ```json
    [
        {
            "id": 1,
            "name": "Online",
            "mode": "timetable",
            "abbreviation": "C",
            "active": true
        },
        {
            "id": 2,
            "name": "Burwood",
            "mode": "automatic",
            "abbreviation": "B",
            "active": true
        },
        {
            "id": 3,
            "name": "Geelong",
            "mode": "manual",
            "abbreviation": "G",
            "active": true
        },
        {
            "id": 4,
            "name": "Geelong_1",
            "mode": "timetable",
            "abbreviation": "gee test1",
            "active": true
        }
    ]
    ```

### POST: Add a Campus 
POST /api/campuses
- URL: `/api/campuses`
- Method:  `POST`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |campus[name] | The name of the campus | formData | string |Yes|
    |campus[mode] | This will determine the campus mode | formData | string |Yes|
    |campus[abbreviation] | The abbreviation for the campus | header | string |Yes|
    |campus[active] | Determines whether campus is active | header | string |Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    


- Response:
`201 Created`: Add a campus
- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' -d 'campus%5Bname%5D=Geelong_2&campus%5Bmode%5D=timetable&campus%5Babbreviation%5D=gee%20test2&campus%5Bactive%5D=true' 'http://localhost:3000/api/campuses'
    ```

- Response body:
    ```json
    {
    "id": 5,
    "name": "Geelong_2",
    "mode": "timetable",
    "abbreviation": "gee test2",
    "active": true
    }
    ```
