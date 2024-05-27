---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Unit_roles
unit_roles : Operations about unit_roles

This markdown document provides detailed documentation for the "unit_roles" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "unit_roles" API has the following operations.

- **DELETE** /api/unit_roles/{id}
- **PUT** /api/unit_roles/{id}
- **GET** /api/unit_roles
- **POST** /api/unit_roles

## Detail of Operations related to unit_roles

### DELETE: Delete a unit role
DELETE /api/unit_roles/{id}

-   URL: `/api/unit_roles/{id}`    
-   Method: `DELETE`
- Paramters:
  
    | Parameter          | Description               | Parameter Type | Data Type | Mandatory |
    |--------------------|---------------------------|----------------|-----------|-----------|
    | Username           | Username                  | header         | string    | Yes       |
    | Auth_Token         | Authentication token      | header         | string    | Yes       |
    | id                 | The ID of the role to update | path          | integer   | Yes       |

- Response: `204`. Delete a unit role
- Example Request:
    ```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: A59eNZjTWQ3mWposSy4Z' 'http://localhost:3000/api/unit_roles/10'
    ```
- Response Body:
    ```json
        {
            "id": 10,
            "user_id": 6,
            "tutorial_id": null,
            "created_at": "2024-04-20T10:54:55.572Z",
            "updated_at": "2024-05-16T04:49:43.955Z",
            "role_id": 1,
            "unit_id": 2
        }
    ```

### PUT: Update a role
PUT /api/unit_roles/{id}

-   URL: `/api/unit_roles/{id}`    
-   Method: `PUT`
-   Parameters:

    | Parameter          | Description               | Parameter Type | Data Type | Mandatory |
    |--------------------|---------------------------|----------------|-----------|-----------|
    | unit_role[role_id] | The role to create with   | formData       | integer   | Yes       |
    | Username           | Username                  | header         | string    | Yes       |
    | Auth_Token         | Authentication token      | header         | string    | Yes       |
    | id                 | The ID of the role to update | path          | integer   | Yes       |
    
-   Example Request:
    
    ```bash    
    `curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' \
    --header 'Accept: application/json' \
    --header 'Username: aadmin' \
    --header 'Auth_Token: A59eNZjTWQ3mWposSy4Z' \
    -d 'unit_role%5Brole_id%5D=1' \
    'http://localhost:3000/api/unit_roles/10'` 
    ```
   
    
-   Response Body:
    
	 ``` json
	    {
	      "id": 10,
	      "role": "Student",
	      "user": {
	        "id": 6,
	        "email": "atutor@doubtfire.com",
	        "first_name": "Akihiro",
	        "last_name": "Noguchi",
	        "username": "atutor",
	        "nickname": "Animations"
	      }
	    }
	 ```

### GET: Get unit roles for authenticated user
GET /api/unit_roles

-   URL: `/api/unit_roles`
-   Method: `GET`
-   Parameters:

    | Parameter   | Description             | Parameter Type | Data Type | Mandatory |
    |-------------|-------------------------|----------------|-----------|-----------|
    | active_only | Show only active roles  | query          | boolean   | No        |
    | Username    | Username                | header         | string    | Yes       |
    | Auth_Token  | Authentication token    | header         | string    | Yes       |
- Response Messages: `200 OK`

- Example Request: 
	```bash
	curl -X GET --header 'Accept: application/json' --header 'Username: atutor' --header 'Auth_Token: qPeRmDp_yeHfVGmfZpzh' 'http://localhost:3000/api/unit_roles'
	```
- Response Body:
    ```json
        [
        {
            "id": 10,
            "role": "Tutor",
            "user": {
            "id": 6,
            "email": "atutor@doubtfire.com",
            "first_name": "Akihiro",
            "last_name": "Noguchi",
            "username": "atutor",
            "nickname": "Animations"
            },
            "unit": {
            "code": "COS20007",
            "id": 2,
            "name": "Object Oriented Programming",
            "my_role": "Tutor",
            "start_date": "2024-03-09",
            "end_date": "2024-06-08",
            "active": true
            }
        },
        {
            "id": 16,
            "role": "Tutor",
            "user": {
            "id": 6,
            "email": "atutor@doubtfire.com",
            "first_name": "Akihiro",
            "last_name": "Noguchi",
            "username": "atutor",
            "nickname": "Animations"
            },
            "unit": {
            "code": "COS10001",
            "id": 1,
            "name": "Introduction to Programming",
            "my_role": "Tutor",
            "start_date": "2024-03-09",
            "end_date": "2024-06-08",
            "active": true
            }
        }
        ]
    ```

### POST: Employ a user as a teaching role in a unit
POST /api/unit_roles

-   URL: `/api/unit_roles`    
-   Method: `POST`
-   Parameters:
    |Parameter|	Description	|Parameter Type|	Data Type	|Mandatory|
    |---------|-------------|--------------|-------------|---------|
    |unit_id |	The id of the unit to employ the staff for|	formData|	integer	|Yes|
    |user_id	|The id of the tutor	|formData	|integer	|Yes|
    |role	|The role for the staff member|	formData	|string|	Yes|
    |Username|	Username	|header	|string	|Yes|
    |Auth_Token	|Authentication token	|header	|string	|Yes|

- Example Request: 
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: t3ys3HB2ary-xYpGj1yc' -d 'unit_id=1&user_id=6&role=tutor' 'http://localhost:3000/api/unit_roles'
    ```
-   Response Body:
    
    ```json    
    {
      "id": 16,
      "role": "Tutor",
      "user": {
        "id": 6,
        "email": "atutor@doubtfire.com",
        "first_name": "Akihiro",
        "last_name": "Noguchi",
        "username": "atutor",
        "nickname": "Animations"
      }
    }
    ```
    
