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
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups
- **GET** /api/units/{unit_id}/group_sets/{id}/groups
- **DELETE** /api/units/{unit_id}/group_sets/{id}
- **PUT** /api/units/{unit_id}/group_sets/{id}
- **POST** /api/units/{unit_id}/group_sets

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

---

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
      "student": "TESTREQ",
      "id": 4,
      "target_grade": "A"
    },
    {
      "student": "TEST2REQ2",
      "id": 5,
      "target_grade": "B"
    }
  ]
  ```

---

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

Header
| Parameter | Description | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| Username | Username | header | string | Yes |
| Auth_Token | Authentication token | header | string | Yes |

Path
| Parameter | Description | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| unit_id | The unit id | path | integer | Yes |
| group_set_id | Id of the group set | path | integer | Yes |
| group_id | id of the group | path | integer | Yes |

Body(Group)
| Parameter | Description | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| name | name of the group | body | string | No |
| tutorial_id | tutorial id for the group | body | integer | No |
| capacity_adjustment | how capacity for the group is adjusted | body | integer | No |
| locked | Is the group locked | body | boolean | No |

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

---

### GET:Download a CSV of students in groups within a group set

GET /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv

- URL: `/api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv`
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
   curl -X GET \--header 'Accept: application/octet-stream' \--header 'Username: aadmin' \--header 'Auth_Token: Say13yA497H8wSFFXZxh'\'http://localhost:3000/api/units/1/group_sets/2/groups/student_csv'
  ```

- Response Body:

  ```
  (Binary CSV file download)

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
  ```
  (Binary CSV file download)
  ```

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
  ```

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

Header
| Parameter | Description | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| Username | Username | header | string | Yes |
| Auth_Token | Authentication token | header | string | Yes |

Path
| Parameter | Description | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| unit_id | The unit id | path | integer | Yes |
| group_set_id | Id of the group set | path | integer | Yes |

Body(Group)
| Parameter | Description | Parameter Type | Data Type | Mandatory |
| ------------------- | -------------------------------------- | -------------- | --------- | --------- |
| name | name of the group | body | string | No |
| tutorial_id | tutorial id for the group | body | integer | No |
| capacity_adjustment | how capacity for the group is adjusted | body | integer | No |

- Response: `201 created`

- Example Request:

  ```bash
   curl -X POST \--header 'Accept: application/json' \--header 'Username: aadmin' \--header 'Auth_Token: Say13yA497H8wSFFXZxh' \-d '{"name":"Group A","tutorial_id":1,"capacity_adjustment":0}' \'http://localhost:3000/api/units/1/group_sets/2/groups''
  ```

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

---

### GET: Get the groups in a group set

GET /api/units/{unit_id}/group_sets/{id}/groups

- URL: `/api/units/{unit_id}/group_sets/{id}/groups`
- Method: `GET`
- Parameter:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | Username   | User Username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |
  | unit_id    |                      | path           | integer   | Yes       |
  | id         |                      | path           | integer   | Yes       |

- Response: `200`

- Example Request:
  ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: student_1' --header 'Auth_Token: sWkFmUyHxKDEN_9Qjxjj' 'http://localhost:3000/api/units/1/group_sets/3/groups'
  ```
- Response Body:
  ```
    []
  ```

---

### DELETE: Delete a group set

DELETE /api/units/{unit_id}/group_sets/{id}

- URL: `/api/units/{unit_id}/group_sets/{id}`
- Method: `DELETE`
- Parameter:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | Username   | User Username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |
  | unit_id    |                      | path           | integer   | Yes       |
  | id         |                      | path           | integer   | Yes       |

- Response: `204`

- Example Request:
  ```bash
    curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5tRKys7u_zJ3ZQ5a4tny' 'http://localhost:3000/api/units/1/group_sets/1'
  ```
- Response Body:
  ```
    true
  ```

---

### PUT: Edits the given group set

PUT /api/units/{unit_id}/group_sets/{id}

- URL: `/api/units/{unit_id}/group_sets/{id}`
- Method: `PUT`
- Parameter:

  | Parameter                                  | Description                                            | Parameter Type | Data Type | Mandatory |
  | ------------------------------------------ | ------------------------------------------------------ | -------------- | --------- | --------- |
  | id                                         | The group set id to edit                               | path           | integer   | Yes       |
  | group_set[name]                            |                                                        | formData       | string    | Yes       |
  | group_set[allow_students_to_create_groups] | Are students allowed to create groups                  | formData       | boolean   | No        |
  | group_set[allow_students_to_manage_groups] | Are students allowed to manage their group memberships | formData       | boolean   | No        |
  | group_set[keep_groups_in_same_class]       | Must groups be kept in the one class                   | formData       | boolean   | No        |
  | group_set[capacity]                        | Capacity for each group                                | formData       | integer   | No        |
  | group_set[locked]                          | Is this group set locked                               | formData       | boolean   | No        |
  | Username                                   | User Username                                          | header         | string    | Yes       |
  | Auth_Token                                 | Authentication token                                   | header         | string    | Yes       |
  | unit_id                                    |                                                        | header         | integer   | Yes       |

- Response: `200`

- Example Request:
  ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5tRKys7u_zJ3ZQ5a4tny' -d 'group_set%5Bname%5D=test_group_test&group_set%5Ballow_students_to_create_groups%5D=true&group_set%5Ballow_students_to_manage_groups%5D=true' 'http://localhost:3000/api/units/1/group_sets/1'
  ```
- Response Body:
  ```json
  {
    "id": 1,
    "name": "test_group_test",
    "allow_students_to_create_groups": true,
    "allow_students_to_manage_groups": true,
    "keep_groups_in_same_class": false,
    "capacity": null,
    "locked": false
  }
  ```

---

### POST: Add a new group set to the given unit

POST /api/units/{unit_id}/group_sets

- URL: `/api/units/{unit_id}/group_sets`
- Method: `POST`
- Parameter:

  | Parameter                                  | Description                                            | Parameter Type | Data Type | Mandatory |
  | ------------------------------------------ | ------------------------------------------------------ | -------------- | --------- | --------- |
  | unit_id                                    | The unit for the new group set                         | path           | integer   | Yes       |
  | group_set[name]                            |                                                        | formData       | string    | Yes       |
  | group_set[allow_students_to_create_groups] | Are students allowed to create groups                  | formData       | boolean   | No        |
  | group_set[allow_students_to_manage_groups] | Are students allowed to manage their group memberships | formData       | boolean   | No        |
  | group_set[keep_groups_in_same_class]       | Must groups be kept in the one class                   | formData       | boolean   | No        |
  | group_set[capacity]                        | Capacity for each group                                | formData       | integer   | No        |
  | Username                                   | User Username                                          | header         | string    | Yes       |
  | Auth_Token                                 | Authentication token                                   | header         | string    | Yes       |

- Response: `201`

- Example Request:
  ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: 5tRKys7u_zJ3ZQ5a4tny' -d 'group_set%5Bname%5D=test_group&group_set%5Ballow_students_to_create_groups%5D=true' 'http://localhost:3000/api/units/1/group_sets'
  ```
- Response Body:
  ```json
  {
    "id": 1,
    "name": "test_group",
    "allow_students_to_create_groups": true,
    "allow_students_to_manage_groups": true,
    "keep_groups_in_same_class": false,
    "capacity": null,
    "locked": false
  }
  ```

---
