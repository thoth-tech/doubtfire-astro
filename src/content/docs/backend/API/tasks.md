---
title: Doubtfire API
---

# API: Tasks

tasks : Operations about tasks
This markdown document provides detailed documentation for the "task" API endpoints including their URLs, methods, parameters, responses, and example requests using curl.

This "tasks" API has the following operations.

- **GET** /api/tasks/{task_id}/similarities/{id}/viewer_url
- **GET** /api/tasks/{task_id}/similarities/{id}/contents/{idx}
- **PUT** /api/tasks/{task_id}/similarities/{id}
- **GET** /api/tasks/{task_id}/similarities
- **DELETE** /api/tasks/{id}/pin
- **POST** /api/tasks/{id}/pin
- **GET** /api/tasks

## Detail of Operations related to tasks.

### GET: Retrieve Viewer URL for Similarity

GET /api/tasks/{task_id}/similarities/{id}/viewer_url

- URL: `/api/tasks/{task_id}/similarities/{id}/viewer_url`
- Method: `GET`
- Parameters:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | task_id    | Task ID              | path           | integer   | Yes       |
  | id         | Similarity ID        | path           | integer   | Yes       |
  | Username   | User username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tasks/1/similarities/1/viewer_url'
  ```

- Response Body:
  ```json
  {
    "viewer_url": "http://example.com/viewer/123"
  }
  ```

---

### GET: Retrieve Similarity Contents

GET /api/tasks/{task_id}/similarities/{id}/contents/{idx}

- URL: `/api/tasks/{task_id}/similarities/{id}/contents/{idx}`
- Method: `GET`
- Parameters:

  | Parameter     | Description                            | Parameter Type | Data Type | Mandatory |
  | ------------- | -------------------------------------- | -------------- | --------- | --------- |
  | task_id       | Task ID                                | path           | integer   | Yes       |
  | id            | Similarity ID                          | path           | integer   | Yes       |
  | idx           | Index of part to download              | path           | integer   | Yes       |
  | as_attachment | Download file as attachment (optional) | query          | boolean   | No        |
  | Username      | User username                          | header         | string    | Yes       |
  | Auth_Token    | Authentication token                   | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tasks/1/similarities/1/contents/0?as_attachment=true'
  ```

- Response Body:
  This endpoint returns the similarity contents as a file. The response does not have a JSON body.

---

### PUT: Update Task Similarity

PUT /api/tasks/{task_id}/similarities/{id}

- URL: `/api/tasks/{task_id}/similarities/{id}`
- Method: `PUT`
- Parameters:

  | Parameter  | Description                           | Parameter Type | Data Type | Mandatory |
  | ---------- | ------------------------------------- | -------------- | --------- | --------- |
  | task_id    | Task ID                               | path           | integer   | Yes       |
  | id         | Similarity ID                         | path           | integer   | Yes       |
  | flagged    | Whether or not to flag the similarity | body           | boolean   | Yes       |
  | Username   | User username                         | header         | string    | Yes       |
  | Auth_Token | Authentication token                  | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X PUT --header 'Content-Type: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  -d '{"flagged": true}' 'http://localhost:3000/api/tasks/1/similarities/1'
  ```

- Response Body:
  ```json
  {
    "id": 1,
    "task_id": 1,
    "flagged": true,
    "similarity_details": {
      "type": "MOSS",
      "pct": 85
    }
  }
  ```

---

### GET: Get Task Similarities

GET /api/tasks/{task_id}/similarities

- URL: `/api/tasks/{task_id}/similarities`
- Method: `GET`
- Parameters:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | task_id    | Task ID              | path           | integer   | Yes       |
  | Username   | User username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tasks/1/similarities'
  ```

- Response Body:
  ```json
  [
    {
      "id": 1,
      "task_id": 1,
      "similarity_details": {
        "type": "MOSS",
        "pct": 85
      }
    },
    {
      "id": 2,
      "task_id": 1,
      "similarity_details": {
        "type": "Turnitin",
        "pct": 90
      }
    }
  ]
  ```

---

### DELETE: Unpin a Task

DELETE /api/tasks/{id}/pin

- URL: `/api/tasks/{id}/pin`
- Method: `DELETE`
- Parameters:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | id         | Task ID              | path           | integer   | Yes       |
  | Username   | User username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |

- Response:
  `204`

- Example Request:

  ```bash
  curl -X DELETE --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tasks/1/pin'

  ```

- Response Body:
  `Task unpinned`
  ```

  ```

---

### POST: Pin a Task

POST /api/tasks/{id}/pin

- URL: `/api/tasks/{id}/pin`
- Method: `POST`
- Parameters:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | id         | Task ID              | path           | integer   | Yes       |
  | Username   | User username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |

- Response:
  `201`

- Example Request:
  ```bash
  curl -X POST --header 'Content-Type: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tasks/1/pin'
  ```
- Response Body:
  ```json
  {
    "message": "Task successfully pinned"
  }
  ```

---

### GET: Retrieve User's Tasks

GET /api/tasks

- URL: `/api/tasks`
- Method: `GET`
- Parameters:

  | Parameter  | Description                           | Parameter Type | Data Type | Mandatory |
  | ---------- | ------------------------------------- | -------------- | --------- | --------- |
  | unit_id    | Unit ID to fetch the task details for | query          | integer   | Yes       |
  | Username   | User username                         | header         | string    | Yes       |
  | Auth_Token | Authentication token                  | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tasks?unit_id=1'
  ```

- Response Body:
  ```json
  [
    {
      "id": 1,
      "task_definition_id": 1,
      "status": "completed",
      "tutorial_id": 1,
      "tutorial_stream_id": 1
    },
    {
      "id": 2,
      "task_definition_id": 2,
      "status": "in_progress",
      "tutorial_id": 2,
      "tutorial_stream_id": 2
    }
  ]
  ```
