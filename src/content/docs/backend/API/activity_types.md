---
title: Doubtfire API Documentation
---

# API: Activity Types

This "activity_types" API has the following operations.
- **GET**: /api/activity types
- **POST**: /api/activity types
- **DELETE**: /api/activity types/{id}
- **GET**: /api/activity types/{id}
- **PUT**: /api/activity types/{id}

## Detail of Operations related to activity types.

### GET activity_types: gets a list of all activity types.

- **URL**: `http://localhost:3000/api/activity_types`
- **Method**: `GET`
- **Parameters**: None
- **Response**:

  - `200 OK`:
    ```json
    [
      {
        "id": 1,
        "name": "Practical",
        "abbreviation": "prac"
      },
      {
        "id": 2,
        "name": "Workshop",
        "abbreviation": "wrkshop"
      },
      {
        "id": 3,
        "name": "Class",
        "abb
      },
      ...
    ]
    ```

- **Example Request**:
  ```bash
  curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/activity_types'
  ```
