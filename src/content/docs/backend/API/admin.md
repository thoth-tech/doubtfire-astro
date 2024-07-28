---
title: Doubtfire API Documentation
---

# API: Admin

admin : Operations about admin
This markdown document provides detailed documentation for the "admin" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl

This "admin" API has the following operations.

- **PUT**: /api/admin/overseer_images/{id}/pull_image
- **GET**: /api/admin/overseer_images
- **POST**: /api/admin/overseer_images
- **DELETE**: /api/admin/overseer_images/{id}
- **PUT**: /api/admin/overseer_images/{id}

## Detail of Operations related to admin.

### PUT: Pull Overseer Image

PUT /api/admin/overseer_images/{id}/pull_image

- URL: `/api/admin/overseer_images/{id}/pull_image`
- Method: `PUT`
- Parameters:
  | Parameter | Description |Parameter Type| Data Type|Mandatory|
  |---------------------|-----------------|------------|------------|---|
  |id |Overseer image ID| path | integer|Yes|
  |Username | User username | header | string | Yes |
  |Auth_Token | Authentication token | header | string |Yes|

- Response:
  `200 OK`

- Example Request:
  ```bash
  curl -X PUT --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/admin/overseer_images/1/pull_image'
  ```
- Response body:
  ```json
  {
    "id": 1,
    "name": "Example Image",
    "tag": "example/tag",
    "status": "pulled"
  }
  ```

---

### GET: Retrieve All Overseer Images

GET /api/admin/overseer_images

- URL: `/api/admin/overseer_images`
- Method: `GET`
- Parameters:
  | Parameter | Description |Parameter Type| Data Type|Mandatory|
  |---------------------|-----------------|------------|------------|---|
  |Username | User username | header | string | Yes |
  |Auth_Token | Authentication token | header | string |Yes|

- Response:
  `200 OK`

- Example Request:
  ```bash
  curl -X PUT --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/admin/overseer_images'
  ```
- Response Body:
  ```json
  [
    {
      "id": 1,
      "name": "Example Image",
      "tag": "example/tag"
    },
    {
      "id": 2,
      "name": "Another Image",
      "tag": "another/tag"
    }
  ]
  ```

---

### POST: Add an Overseer Image

POST /api/admin/overseer_images

- URL: `/api/admin/overseer_images`
- Method: `POST`
- Parameters:
  | Parameter | Description | Parameter Type | Data Type | Mandatory |
  |-----------------------|-------------------------------------------|----------------|-----------|-----------|
  | overseer_image | The overseer image object | body | hash | Yes |
  | overseer_image.name | The name to display for this image | body | string | Yes |
  | overseer_image.tag | The tag used to retrieve from container repo | body | string | Yes |
  | Username | User username | header | string | Yes |
  | Auth_Token | Authentication token | header | string | Yes |

- Response:
  `201`

- Example Request:
  ```bash
  curl -X POST --header 'Content-Type: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'-d '{
    "overseer_image": {
      "name": "Example Image",
      "tag": "example/tag"
    }
  }' 'http://localhost:3000/api/admin/overseer_images'
  ```
- Response Body:
  ```json
  {
    "id": 1,
    "name": "Example Image",
    "tag": "example/tag"
  }
  ```

---

### DELETE: Delete an Overseer Image

DELETE /api/admin/overseer_images/{id}

- URL: `/api/admin/overseer_images/{id}`
- Method: `DELETE`
- Parameters:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | id         | Overseer image ID    | path           | integer   | Yes       |
  | Username   | User username        | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |

- Response:

  - `204`

- Example Request:
  ```bash
  curl -X DELETE --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/admin/overseer_images/1'
  ```
- Response Body:
  `Overseer image deleted `

---

### PUT: Update an Overseer Image

PUT /api/admin/overseer_images/{id}

- URL: `/api/admin/overseer_images/{id}`
- Method: `PUT`
- Parameters:

  | Parameter           | Description                                  | Parameter Type | Data Type | Mandatory |
  | ------------------- | -------------------------------------------- | -------------- | --------- | --------- |
  | id                  | Overseer image ID                            | path           | integer   | Yes       |
  | overseer_image      | The overseer image object                    | body           | hash      | Yes       |
  | overseer_image.name | The name to display for this image           | body           | string    | No        |
  | overseer_image.tag  | The tag used to retrieve from container repo | body           | string    | No        |
  | Username            | User username                                | header         | string    | Yes       |
  | Auth_Token          | Authentication token                         | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:
  ```bash
  curl -X PUT --header 'Content-Type: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  -d '{
    "overseer_image": {
      "name": "Updated Example Image",
      "tag": "updated/tag"
    }
  }' 'http://localhost:3000/api/admin/overseer_images/1'
  ```
- Response Body:
  ```json
  {
    "id": 1,
    "name": "Updated Example Image",
    "tag": "updated/tag"
  }
  ```
