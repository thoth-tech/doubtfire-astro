---
title: Doubtfire API 
---

# List of Doubtfire 

# API: tutorials 
tutorials : Operations about tutorials
This markdown document provides detailed documentation for the "tutorials" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "tutorials" API has the following operations.

- **DELETE** /api/tutorials/{id}
- **PUT** /api/tutorials/{id}
- **POST** /api/tutorials


## Detail of Operations related to users.

### DELETE: Delete a tutorial
DELETE /api/tutorials/{id}

- URL: `/api/tutorials/{id}`
- Method: `DELETE`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id | | path | integer|Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response: 
        `204 OK`: Tutorial deleted successfully.

- Example Request:
    ```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: yzRDggcmzbVnYEbszVV1' 'http://localhost:3000/api/campuses/6'
    ```
- Response body: 
    ```
        true
    ```
-----------------------------------------------------------------------------
### PUT: Create a tutorial
PUT /api/tutorials/{id}

- URL: `/api/tutorials/{id}`
- Method: `PUT`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    | tutorial [unit_id] | Id of the unit| formData | integer|Yes|
    | tutorial [tutor_id] | Id of the tutor| formData | integer||
    | tutorial [campus_id] | Id of the campus| formData | integer||
    | tutorial [capacity] | Capacity of the tutorial| formData | integer||
    |tutorial[abbreviation] | The tutorials code| formData | string||
    |tutorial[meeting_location] |The tutorials location | formData | string||
    |tutorial[meeting_day] |Day of the tutorials  | formData | string||
    |tutorial[meeting_time] |Time of the tutorials  | formData | string||
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response: 
        `200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 3DLo9xQoiKbXb7-ViNzJ' -d 'tutorial%5Btutor_id%5D=43&tutorial%5Bcapacity%5D=45' 'http://localhost:3000/api/tutorials/1'
    ```
- Response body: 
    ```json
    {
        "id": 1,
        "meeting_day": "Wednesday",
        "meeting_time": "15:00",
        "meeting_location": "geelong",
        "abbreviation": "LA1-01",
        "campus_id": 2,
        "capacity": 45,
        "tutorial_stream_abbr": "wrkshop-2",
        "num_students": 6,
        "tutor_id": 2
    }
    ```


-----------------------------------------------------------------------------

### POST: Create a tutorial
POST /api/tutorials

- URL: `/api/tutorials`
- Method: `POST`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    | tutorial [unit_id] | Id of the unit| formData | integer|Yes|
    | tutorial [tutor_id] | Id of the tutor| formData | integer|Yes|
    | tutorial [campus_id] | Id of the campus| formData | integer||
    | tutorial [capacity] | Capacity of the tutorial| formData | integer|Yes|
    |tutorial[abbreviation] | The tutorials code| formData | string|Yes|
    |tutorial[meeting_location] |The tutorials location | formData | string|Yes|
    |tutorial[meeting_day] |Day of the tutorials  | formData | string|Yes|
    |tutorial[meeting_time] |Time of the tutorials  | formData | string|Yes|
    |tutorial[tutorial_stream_abbr] |Abbreviation of the associated tutorial stream  | formData | string| |
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response: 
        `201 Created`

- Example Request:
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 3DLo9xQoiKbXb7-ViNzJ' -d 'tutorial%5Bunit_id%5D=1&tutorial%5Btutor_id%5D=43&tutorial%5Bcapacity%5D=45&tutorial%5Babbreviation%5D=tut_test2&tutorial%5Bmeeting_location%5D=online&tutorial%5Bmeeting_day%5D=Tue&tutorial%5Bmeeting_time%5D=11%3A00' 'http://localhost:3000/api/tutorials'
    ```
- Response body: 
    ```
        null
    ```