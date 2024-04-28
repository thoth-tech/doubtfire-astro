---
title: Doubtfire API Documentation
---

# API: Activity Types

This API Get all the activity types.

Operations related to activity types.

### List Activity Types

Returns a list of all activity types.

- **URL**: `/activity_types`
- **Method**: `GET`
- **Parameters**: None
- **Response**:

  - `200 OK`:
    ```json
    [
      {
        "id": 1,
        "name": "Homework"
      },
      {
        "id": 2,
        "name": "Quiz"
      },
      ...
    ]
    ```

- **Example Request**:
  ```bash
  curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/activity_types'
  ```
