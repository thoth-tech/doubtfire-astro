---
title: Doubtfire API
---

# List of Doubtfire

# API: Stats

tutorials : Operations about tutorials
This markdown document provides detailed documentation for the "Stats" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "Units" API has the following operations.

- **GET** /api/units/{id}/stats/task_completion_stats
- **GET** /api/units/{id}/stats/task_status_pct
- **GET** /api/units/{id}/stats/student_target_grade

### GET: Download stats related to the number of completed tasks

GET /api/units/{id}/stats/task_completion_stats

- URL: `/api/units/{id}/stats/task_completion_stats`
- Method: `GET`
- Parameter:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | Username   | Username             | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |
  | id         | The project id       | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
  ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/stats/task_completion_stats'
  ```
- Response Body:

  ```json
  {
    "unit": {
      "median": 13,
      "lower": 12,
      "upper": 17,
      "min": 2,
      "max": 19
    },
    "tutorial": {
      "1": {
        "median": 11,
        "lower": 2,
        "upper": 13,
        "min": 2,
        "max": 13
      },
      "3": {
        "median": 16,
        "lower": 13,
        "upper": 17,
        "min": 12,
        "max": 17
      }
    },
    "grade": {
      "0": {
        "median": 11,
        "lower": 8,
        "upper": 11,
        "min": 8,
        "max": 11
      },
      "1": {
        "median": 17,
        "lower": 13,
        "upper": 17,
        "min": 13,
        "max": 17
      },
      "2": {
        "median": 7.5,
        "lower": 2,
        "upper": 13,
        "min": 2,
        "max": 13
      },
      "3": {
        "median": 13,
        "lower": 13,
        "upper": 17,
        "min": 2,
        "max": 19
      }
    }
  }
  ```

---

### GET: Download stats related to the status of students with tasks

GET /api/units/{id}/stats/task_status_pct

- URL: `/api/units/{id}/stats/task_status_pct`
- Method: `GET`
- Parameter:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | Username   | Username             | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |
  | id         | The project id       | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
  ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/stats/task_status_pct'
  ```
- Response Body:
  ```json
  {
    "1": {
      "1": [
        {
          "tutorial_stream_id": null,
          "status": "complete",
          "num": 4
        },
        {
          "tutorial_stream_id": null,
          "status": "redo",
          "num": 1
        },
        {
          "tutorial_stream_id": null,
          "status": "demonstrate",
          "num": 1
        }
      ]
    }
  }
  ```

---

### GET: Download the stats related to the number of students aiming for each grade

GET /api/units/{id}/stats/student_target_grade

- URL: `/api/units/{id}/stats/student_target_grade`
- Method: `GET`
- Parameter:

  | Parameter  | Description          | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------- | -------------- | --------- | --------- |
  | Username   | Username             | header         | string    | Yes       |
  | Auth_Token | Authentication token | header         | string    | Yes       |
  | id         | The project id       | path           | integer   | Yes       |

- Response: `200 OK`

- Example Request:
  ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: Say13yA497H8wSFFXZxh' 'http://localhost:3000/api/units/1/stats/student_target_grade'
  ```
- Response Body:
  ```json
  [
    {
      "tutorial_id": null,
      "tutorial_stream_id": null,
      "grade": 0,
      "num": 1
    },
    {
      "tutorial_id": null,
      "tutorial_stream_id": null,
      "grade": 1,
      "num": 1
    },
    {
      "tutorial_id": null,
      "tutorial_stream_id": null,
      "grade": 2,
      "num": 1
    },
    {
      "tutorial_id": null,
      "tutorial_stream_id": null,
      "grade": 3,
      "num": 3
    },
    {
      "tutorial_id": 1,
      "tutorial_stream_id": 4,
      "grade": 0,
      "num": 2
    },
    {
      "tutorial_id": 1,
      "tutorial_stream_id": 4,
      "grade": 1,
      "num": 1
    },
    {
      "tutorial_id": 1,
      "tutorial_stream_id": 4,
      "grade": 2,
      "num": 1
    },
    {
      "tutorial_id": 1,
      "tutorial_stream_id": 4,
      "grade": 3,
      "num": 2
    },
    {
      "tutorial_id": 3,
      "tutorial_stream_id": 3,
      "grade": 0,
      "num": 1
    },
    {
      "tutorial_id": 3,
      "tutorial_stream_id": 3,
      "grade": 1,
      "num": 1
    },
    {
      "tutorial_id": 3,
      "tutorial_stream_id": 3,
      "grade": 3,
      "num": 4
    }
  ]
  ```

---
