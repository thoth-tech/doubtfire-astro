---
title: Doubtfire API 
---

# List of Doubtfire 

# API: tii_eula
tii_eula : Operations about tii_eula
This markdown document provides detailed documentation for the "tii_eula" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "tii_eula" API has the following operations.
- **PUT** /api/tii_eula/users/{id}/accept
- **GET** /api/tii_eula


## Detail of Operations related to tii_eula.

### PUT: Trigger an action on the given group attachment
PUT /api/tii_eula/users/{id}/accept

- URL: `/api/tii_eula/users/{id}/accept`
- Method: `PUT`
- Parameters:
     
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id | The user id who is accepting the EULA| path | integer |Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
   
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/tii_eula/users/1/accept'
    ```
- Response body: 
    ```
    "22448dfcaa620f1ad665d4b7"  
    ```


### GET: Get the current EULA html
GET /api/tii_eula

- URL: `/api/tii_eula`
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
    curl -X GET --header 'Accept: text/html' --header 'Username: aadmin' --header 'Auth_Token: ZRZfC2r8_2KNZKdstXHc' 'http://localhost:3000/api/tii_eula'
    ```
- Response body: 
    ```
    null
    ```

