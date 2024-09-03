---
title: Doubtfire API
---

# API: tii_actions

tii_actions : Operations about tii_actions
This markdown document provides detailed documentation for the "tii_actions" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "tii_actipns" API has the following operations.

- **PUT** /api/tii_actions/{id}
- **GET** /api/tii_actions

## Detail of Operations related to tii_actions.

### GET: Retrieve Outstanding Turnitin Actions

GET /api/tii_actions

- URL: `/api/tii_actions`
- Method: `GET`
- Parameters:

  | Parameter     | Description                             | Parameter Type | Data Type | Mandatory | Default |
  | ------------- | --------------------------------------- | -------------- | --------- | --------- | ------- |
  | unit_id       | The ID of the unit to filter by         | query          | integer   | No        | nil     |
  | limit         | The maximum number of actions to return | query          | integer   | No        | 50      |
  | offset        | The offset to start from                | query          | integer   | No        | 0       |
  | show_complete | Include complete actions?               | query          | boolean   | No        | false   |
  | Username      | User username                           | header         | string    | Yes       |         |
  | Auth_Token    | Authentication token                    | header         | string    | Yes       |         |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  'http://localhost:3000/api/tii_actions?unit_id=1&limit=10&offset=0&show_complete=false'
  ```

- Response Body:
  ```json
  [
    {
      "id": 1,
      "unit_id": 1,
      "action": "Turnitin action details",
      "complete": false,
      "updated_at": "2023-07-14T10:00:00Z"
    },
    {
      "id": 2,
      "unit_id": 1,
      "action": "Another Turnitin action details",
      "complete": false,
      "updated_at": "2023-07-14T09:00:00Z"
    }
  ]
  ```

---

### PUT: Trigger an Action on a Turnitin Group Attachment

PUT /api/tii_actions/{id}

- URL: `/api/tii_actions/{id}`
- Method: `PUT`
- Parameters:

  | Parameter  | Description                     | Parameter Type | Data Type | Mandatory | Default |
  | ---------- | ------------------------------- | -------------- | --------- | --------- | ------- |
  | id         | The ID of the Turnitin action   | path           | integer   | Yes       |         |
  | action     | The action to perform: retry    | body           | string    | Yes       |         |
  | unit_id    | The ID of the unit to filter by | body           | integer   | No        | nil     |
  | Username   | User username                   | header         | string    | Yes       |         |
  | Auth_Token | Authentication token            | header         | string    | Yes       |         |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X PUT --header 'Content-Type: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n'
  -d '{"action": "retry", "unit_id": 1}' 'http://localhost:3000/api/tii_actions/1'
  ```

- Response Body:
  ```json
  {
    "message": "Retry action triggered successfully"
  }
  ```
