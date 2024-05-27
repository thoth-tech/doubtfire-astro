---
title: Doubtfire API Documentation
---

# API: webcal 
webcal : Operations about webcal
This markdown document provides detailed documentation for the "webcal" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "webcal" API has the following operations.

- **GET** /api/webcal/{guid}
- **GET** /api/webcal
- **PUT** /api/webcal

## Detail of Operations related to webcal.

### GET: Serve webcal with the specified GUID
GET /api/webcal/{guid}

- URL: `/api/webcal/{guid}`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |guid | The GUID of the webcal | header | string |Yes|
    

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: text/calendar' 'http://localhost:3000/api/webcal/545c2530-2932-4bdb-8d79-ae2992494674'
    ```
- Response body: 
    ```json
        BEGIN:VCALENDAR
        VERSION:2.0
        PRODID:OnTrack
        CALSCALE:GREGORIAN
        METHOD:PUBLISH
        X-PUBLISHED-TTL;VALUE=DURATION:P1D
        REFRESH-INTERVAL;VALUE=DURATION:P1D
        END:VCALENDAR
    ```

### GET: Get webcal details of the authenticated user
GET /api/webcal

- URL: `/api/webcal`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/webcal'
    ```
- Response body: 
    ```json
        {
            "enabled": false
        }
    ```

### PUT: Update webcal details of the authenticated user
PUT /api/webcal

- URL: `/api/webcal`
- Method: `PUT`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |webcal[enabled] | Is the webcal enabled? | formData | boolean ||
    |webcal[should_change_guid] | Should the GUID of the webcal be changed? | formData | boolean ||
    |webcal[include_start_dates] | Should events for start dates be included? | formData | boolean ||
    |webcal[unit_exclusions] | IDs of units that must be excluded from the webcal | formData | 	Array[integer] ||
    |webcal[reminder][time] |  | formData | integer ||
    |webcal[reminder][unit] | w: weeks, d: days, h: hours, m: minutes | formData | string ||
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' -d 'webcal%5Benabled%5D=true' 'http://localhost:3000/api/webcal'
    ```
- Response body: 
    ```json
        {
            "id": 1,
            "guid": "545c2530-2932-4bdb-8d79-ae2992494674",
            "include_start_dates": false,
            "enabled": true,
            "unit_exclusions": []
        }
    ```