---
title: Doubtfire API
---

# List of Doubtfire

# API: Units - Group Sets

Units : Operations about Units

This markdown document provides detailed documentation for the "group_sets" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "units" API page has the following operations.

- **DELETE** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{id}
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{project_id}
- **GET** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members
- **DELETE** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}
- **PUT** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}
- **GET** /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv
- **GET** /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv
- **POSt** /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups

### DELETE: Remove a group member

DELETE /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{id}

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{id}`
- Method: `DELETE`
- Parameter:

  | Parameter    | Description          | Parameter Type | Data Type | Mandatory |
  | ------------ | -------------------- | -------------- | --------- | --------- |
  | Username     | Username             | header         | string    | Yes       |
  | Auth_Token   | Authentication token | header         | string    | Yes       |
  | unit_id      | The unit id          | path           | integer   | Yes       |
  | group_set_id | Id of the group set  | path           | integer   | Yes       |
  | group_id     | id of the group      | path           | integer   | Yes       |
  | id           | id of the member     | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:

  ```bash
   curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/group_sets/2/groups/3/members/4'
  '
  ```

- Response Body:
  ```
        True
  ```

---

### POST : Add a member to a group

POST /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{project_id}

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{project_id}`
- Method: `POST`
- Parameter:

| Parameter    | Description              | Parameter Type | Data Type | Mandatory |
| ------------ | ------------------------ | -------------- | --------- | --------- |
| Username     | Username                 | header         | string    | Yes       |
| Auth_Token   | Authentication token     | header         | string    | Yes       |
| unit_id      | The unit id              | path           | integer   | Yes       |
| group_set_id | Id of the group set      | path           | integer   | Yes       |
| group_id     | id of the group          | path           | integer   | Yes       |
| project_id   | project id of the member | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
  ```bash
   curl -X POST --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/group_sets/2/groups/3/members/4'
  ```
- Response Body:
  ```json
  {
    "student_username": "TESTREQ",
    "id": 4,
    "student_first_name": "TEST",
    "student_last_name": "REQ",
    "student_nickname": "TEST1",
    "target_grade": "A"
  }
  ```
  ### GET: Get the members of the group

GET /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members`
- Method: `GET`
- Parameter:

| Parameter    | Description          | Parameter Type | Data Type | Mandatory |
| ------------ | -------------------- | -------------- | --------- | --------- |
| Username     | Username             | header         | string    | Yes       |
| Auth_Token   | Authentication token | header         | string    | Yes       |
| unit_id      | The unit id          | path           | integer   | Yes       |
| group_set_id | Id of the group set  | path           | integer   | Yes       |
| group_id     | id of the group      | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
  ```bash
   curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/group_sets/2/groups/3/members'
  ```
- Response Body:
  ```json
  [
    {
      "student_username": "TESTREQ",
      "id": 4,
      "student_first_name": "TEST",
      "student_last_name": "REQ",
      "student_nickname": "TEST1",
      "target_grade": "A"
    },
    {
      "student_username": "TEST2REQ2",
      "id": 5,
      "student_first_name": "TEST2",
      "student_last_name": "REQ2",
      "student_nickname": "TEST2",
      "target_grade": "B"
    }
  ]
  ```

### DELETE: Delete a group

DELETE /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}`
- Method: `DELETE`
- Parameter:

| Parameter    | Description          | Parameter Type | Data Type | Mandatory |
| ------------ | -------------------- | -------------- | --------- | --------- |
| Username     | Username             | header         | string    | Yes       |
| Auth_Token   | Authentication token | header         | string    | Yes       |
| unit_id      | The unit id          | path           | integer   | Yes       |
| group_set_id | Id of the group set  | path           | integer   | Yes       |
| group_id     | id of the group      | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
  ```bash
   curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/group_sets/2/groups/3'
  ```
- Response Body:
  ```
  True
  ```

---

### PUT: Update a group

PUT /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}`
- Method: `PUT`
- Parameter:

| Parameter           | Description                            | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| Username            | Username                               | header         | string    | Yes       |
| Auth_Token          | Authentication token                   | header         | string    | Yes       |
| unit_id             | The unit id                            | path           | integer   | Yes       |
| group_set_id        | Id of the group set                    | path           | integer   | Yes       |
| group_id            | id of the group                        | path           | integer   | Yes       |
| name                | name of the group                      | body           | string    | No        |
| tutorial_id         | tutorial id for the group              | body           | integer   | No        |
| capacity_adjustment | how capacity for the group is adjusted | body           | integer   | No        |
| locked              | Is the group locked                    | body           | bookean   | No        |

- Response: `200 OK`

- Example Request:
  ```bash
   curl -X PUT --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' -d '{"name":"New Group Name","tutorial_id":2,"capacity_adjustment":3,"locked":true}' 'http://localhost:3000/api/units/1/group_sets/2/groups/3'
  ```
- Response Body:
  ```json
  {
    "id": 3,
    "name": "New Group Name",
    "tutorial_id": 2,
    "capacity_adjustment": 3,
    "locked": true
  }
  ```

### GET:Download a CSV of students in groups within a group set

GET /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv`
- Method: `GET`
- Parameter:

| Parameter    | Description          | Parameter Type | Data Type | Mandatory |
| ------------ | -------------------- | -------------- | --------- | --------- | --- |
| Username     | Username             | header         | string    | Yes       |
| Auth_Token   | Authentication token | header         | string    | Yes       |
| unit_id      | The unit id          | path           | integer   | Yes       |
| group_set_id | Id of the group set  | path           | integer   | Yes       |     |

- Response: `200 OK`

- Example Request:

  ```bash
   curl -X GET \--header 'Accept: application/octet-stream' \--header 'Username: aadmin' \--header 'Auth_Token: Say13yA497H8wSFFXZxh'\'http://localhost:3000/api/units/1/group_sets/2/groups/student_csv'
  ```

- Response Body:
  (Binary CSV file download)

  ```

  ```

---

### POST: Upload a CSV for students in groups within a group set

POST /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv`
- Method: `POST`
- Parameter:

| Parameter    | Description          | Parameter Type | Data Type | Mandatory |
| ------------ | -------------------- | -------------- | --------- | --------- |
| Username     | Username             | header         | string    | Yes       |
| Auth_Token   | Authentication token | header         | string    | Yes       |
| unit_id      | The unit id          | path           | integer   | Yes       |
| group_set_id | Id of the group set  | path           | integer   | Yes       |
| file         | CSV file upload      | body           | file      | Yes       |

- Response: `200 OK`

- Example Request:

  ```bash
   curl -X POST \--header 'Accept: application/json' \ --header 'Username: aadmin' \ --header 'Auth_Token: Say13yA497H8wSFFXZxh' \--form 'file=@/path/to/file.csv' \'http://localhost:3000/api/units/1/group_sets/2/groups/student_csv'
  ```

- Response Body:

```json
{
  "result": "Success"
}
```

---

### GET: Download a CSV of groups within a group set

GET /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/csv`
- Method: `GET`
- Parameter:

| Parameter    | Description          | Parameter Type | Data Type | Mandatory |
| ------------ | -------------------- | -------------- | --------- | --------- |
| Username     | Username             | header         | string    | Yes       |
| Auth_Token   | Authentication token | header         | string    | Yes       |
| unit_id      | The unit id          | path           | integer   | Yes       |
| group_set_id | Id of the group set  | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:

  ```bash
   curl -X GET \--header 'Accept: application/octet-stream' \--header 'Username: aadmin' \--header 'Auth_Token: Say13yA497H8wSFFXZxh' \'http://localhost:3000/api/units/1/group_sets/2/groups/csv'
  ```

- Response Body:
  (Binary CSV file download)

````
---
### POST: Upload a CSV for groups within a group set

POST /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/csv`
- Method: `POST`
- Parameter:

| Parameter    | Description          | Parameter Type | Data Type | Mandatory |
| ------------ | -------------------- | -------------- | --------- | --------- |
| Username     | Username             | header         | string    | Yes       |
| Auth_Token   | Authentication token | header         | string    | Yes       |
| unit_id      | The unit id          | path           | integer   | Yes       |
| group_set_id | Id of the group set  | path           | integer   | Yes       |
| file         | CSV file upload      | body           | file      | Yes       |

- Response: `200 OK`

- Example Request:

  ```bash
   curl -X POST \--header 'Accept: application/json' \--header 'Username: aadmin' \--header 'Auth_Token: Say13yA497H8wSFFXZxh' \--form 'file=@/path/to/file.csv' \'http://localhost:3000/api/units/1/group_sets/2/groups/csv'
````

- Response Body:

```json
{
  "result": "Success"
}
```

---

### POST: Add a new group to the group set

POST /api/units/{unit_id}/group_sets/{group_set_id}/groups

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups`
- Method: `POST`
- Parameter:

| Parameter           | Description                            | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| Username            | Username                               | header         | string    | Yes       |
| Auth_Token          | Authentication token                   | header         | string    | Yes       |
| unit_id             | The unit id                            | path           | integer   | Yes       |
| group_set_id        | Id of the group set                    | path           | integer   | Yes       |
| Name                | Name of Group                          | body           | String    | No        |
| Tutorial_id         | ID of the tutorial for the group       | body           | integer   | Yes       |
| capacity_adjustment | How capacity for the group is adjusted | body           | integer   | No        |

- Response: `201 created`

- Example Request:

  ```bash
   curl -X POST \--header 'Accept: application/json' \--header 'Username: aadmin' \--header 'Auth_Token: Say13yA497H8wSFFXZxh' \-d '{"name":"Group A","tutorial_id":1,"capacity_adjustment":0}' \'http://localhost:3000/api/units/1/group_sets/2/groups''
  ```

````
- Response Body:

```json
{
  "group": {
    "id": 3,
    "name": "Group A",
    "tutorial_id": 1,
    "capacity_adjustment": 0
}
}
```
````
