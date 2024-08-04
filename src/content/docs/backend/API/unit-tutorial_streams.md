---
title: Doubtfire API
---

# List of Doubtfire

# API: Units (Page 1)

units : Operations about units

This markdown document provides detailed documentation for the "units" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "units" API page has the following operations (**_3 operations_**).

- **DELETE** /api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}
  **PUT** /api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}
  **POST** /api/units/{unit_id}/tutorial_streams

---

### DELETE: Remove Tutorial stream from the Unit

DELETE /api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}

- URL: `/api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}`
- Method: `DELETE`
- Parameter:

  | Parameter    | Description                          | Parameter Type | Data Type | Mandatory |
  | ------------ | ------------------------------------ | -------------- | --------- | --------- |
  | Username     | Username                             | header         | string    | Yes       |
  | Auth_Token   | Authentication token                 | header         | string    | Yes       |
  | unit_id      | The unit id                          | path           | integer   | Yes       |
  | abbreviation | abbreviation for the tutorial stream | path           | string    | Yes       |

- Response: `200 OK`

- Example Request:

  ```bash
   curl -X DELETE --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/tutorial_streams/TS_1'

  ```

- Response Body:
  ```
        True
  ```

---

### PUT: Update a tutorial stream in the unit

PUT /api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}

- URL: `/api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}`
- Method: `PUT`
- Parameter:

  | Parameter     | Description                          | Parameter Type | Data Type | Mandatory |
  | ------------- | ------------------------------------ | -------------- | --------- | --------- |
  | Username      | Username                             | header         | string    | Yes       |
  | Auth_Token    | Authentication token                 | header         | string    | Yes       |
  | unit_id       | The unit id                          | path           | integer   | Yes       |
  | abbreviation  | abbreviation for the tutorial stream | path           | string    | No        |
  | name          | name of the tutorial stream          | body           | string    | No        |
  | activity_type | abbreviation for activity type       | body           | string    | No        |

- Response: `200`

- Example Request:

  ```bash
   curl -X PUT \
  --header 'Accept: application/json' \
  --header 'Username: aadmin' \
  --header 'Auth_Token: Say13yA497H8wSFFXZxh' \ -d '{"name":"Test","abbreviation":"TSAB","activity_type":"Test1"}' \ 'http://localhost:3000/api/units/1/tutorial_streams/TS1'


  ```

- Response Body:

  ```json
  {
    "tutorial_stream": {
      "name": "Test",
      "abbreviation": "TSAB",
      "activity_type": "Test1"
    }
  }
  ```

---

### POST: Add a tutorial stream to the unit

POST /api/units/{unit_id}/tutorial_streams

- URL: `/api/units/{unit_id}/tutorial_streams`
- Method: `POST`
- Parameter:

  | Parameter     | Description                    | Parameter Type | Data Type | Mandatory |
  | ------------- | ------------------------------ | -------------- | --------- | --------- |
  | Username      | Username                       | header         | string    | Yes       |
  | Auth_Token    | Authentication token           | header         | string    | Yes       |
  | unit_id       | The unit id                    | path           | integer   | Yes       |
  | activity_type | abbreviation for activity type | body           | string    | Yes       |

- Response: `201`

- Example Request:

  ```bash
   curl -X POST \
  --header 'Accept: application/json' \
  --header 'Username: aadmin' \
  --header 'Auth_Token: Say13yA497H8wSFFXZxh' \ -d '{"activity_type_abbr":"Test1"}' \ 'http://localhost:3000/api/units/1/tutorial_streams'


  ```

- Response Body:

  ```json
  {
    "tutorial_stream": {
      "name": "Test",
      "abbreviation": "TSAB",
      "activity_type": "Test1"
    }
  }
  ```
