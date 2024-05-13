---
title: Doubtfire API Documentation
---

# API: Students
students : Operations about students
This markdown document provides detailed documentation for the "students" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl

This "students" API has the following operations.
- **GET**: /api/students

## Detail of Operations related to students.

### GET: get users
GET /api/students

- URL: `/api/students`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |unit_id |The unit to get the students for| query | integer|Yes|
    |withdraw | Show all students or just current students | query |boolean| |
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/students?unit_id=1'
    ```
- Response body: 
    ```json
    [
    {
        "id": 6,
        "enrolled": true,
        "campus_id": 2,
        "student": {
        "id": 28,
        "student_id": null,
        "username": "student_5",
        "email": "student_5@doubtfire.com",
        "first_name": "Dale",
        "last_name": "Homenick",
        "nickname": "student_5"
        },
        "target_grade": 2,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.73,
        "orange_pct": 0.03,
        "blue_pct": 0.12,
        "green_pct": 0.12,
        "order_scale": 24.3
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": 1
        }
        ]
    },
    {
        "id": 5,
        "enrolled": true,
        "campus_id": 2,
        "student": {
        "id": 27,
        "student_id": null,
        "username": "student_4",
        "email": "student_4@doubtfire.com",
        "first_name": "Emanuel",
        "last_name": "Kutch",
        "nickname": "student_4"
        },
        "target_grade": 0,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.33,
        "orange_pct": 0,
        "blue_pct": 0.05,
        "green_pct": 0.62,
        "order_scale": 67
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": 1
        }
        ]
    },
    {
        "id": 14,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 36,
        "student_id": null,
        "username": "student_13",
        "email": "student_13@doubtfire.com",
        "first_name": "Georgeanna",
        "last_name": "Fay",
        "nickname": "student_13"
        },
        "target_grade": 0,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.95,
        "orange_pct": 0,
        "blue_pct": 0.05,
        "green_pct": 0,
        "order_scale": 5
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": 3
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 12,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 34,
        "student_id": null,
        "username": "student_11",
        "email": "student_11@doubtfire.com",
        "first_name": "Geraldo",
        "last_name": "Rutherford",
        "nickname": "student_11"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.36,
        "orange_pct": 0,
        "blue_pct": 0.06,
        "green_pct": 0.58,
        "order_scale": 63.99999999999999
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": 2
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 7,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 29,
        "student_id": null,
        "username": "student_6",
        "email": "student_6@doubtfire.com",
        "first_name": "Gracia",
        "last_name": "Heathcote",
        "nickname": "student_6"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.48,
        "orange_pct": 0,
        "blue_pct": 0.08,
        "green_pct": 0.44,
        "order_scale": 52
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": 2
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 11,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 33,
        "student_id": null,
        "username": "student_10",
        "email": "student_10@doubtfire.com",
        "first_name": "Herbert",
        "last_name": "Flatley",
        "nickname": "student_10"
        },
        "target_grade": 0,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.47,
        "orange_pct": 0.05,
        "blue_pct": 0.1,
        "green_pct": 0.38,
        "order_scale": 48.5
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": 2
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 15,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 37,
        "student_id": null,
        "username": "student_14",
        "email": "student_14@doubtfire.com",
        "first_name": "Idalia",
        "last_name": "Smith",
        "nickname": "student_14"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.5,
        "orange_pct": 0.03,
        "blue_pct": 0.03,
        "green_pct": 0.44,
        "order_scale": 47.3
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": 3
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 9,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 31,
        "student_id": null,
        "username": "student_8",
        "email": "student_8@doubtfire.com",
        "first_name": "John",
        "last_name": "Padberg",
        "nickname": "student_8"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.5,
        "orange_pct": 0,
        "blue_pct": 0.03,
        "green_pct": 0.47,
        "order_scale": 50
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": 2
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 13,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 35,
        "student_id": null,
        "username": "student_12",
        "email": "student_12@doubtfire.com",
        "first_name": "Jordon",
        "last_name": "Pagac",
        "nickname": "student_12"
        },
        "target_grade": 1,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.34,
        "orange_pct": 0,
        "blue_pct": 0.03,
        "green_pct": 0.63,
        "order_scale": 66
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": 3
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 10,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 32,
        "student_id": null,
        "username": "student_9",
        "email": "student_9@doubtfire.com",
        "first_name": "Juan",
        "last_name": "Daugherty",
        "nickname": "student_9"
        },
        "target_grade": 2,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.47,
        "orange_pct": 0.03,
        "blue_pct": 0.06,
        "green_pct": 0.44,
        "order_scale": 50.3
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": 2
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 18,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 40,
        "student_id": null,
        "username": "student_17",
        "email": "student_17@doubtfire.com",
        "first_name": "Kathey",
        "last_name": "Heathcote",
        "nickname": "student_17"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.33,
        "orange_pct": 0.03,
        "blue_pct": 0.11,
        "green_pct": 0.53,
        "order_scale": 64.3
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": 3
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 17,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 39,
        "student_id": null,
        "username": "student_16",
        "email": "student_16@doubtfire.com",
        "first_name": "Kenny",
        "last_name": "Blanda",
        "nickname": "student_16"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.5,
        "orange_pct": 0,
        "blue_pct": 0.08,
        "green_pct": 0.42,
        "order_scale": 50
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": 3
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 16,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 38,
        "student_id": null,
        "username": "student_15",
        "email": "student_15@doubtfire.com",
        "first_name": "Krystal",
        "last_name": "Crooks",
        "nickname": "student_15"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.36,
        "orange_pct": 0,
        "blue_pct": 0.06,
        "green_pct": 0.58,
        "order_scale": 63.99999999999999
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": 3
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 2,
        "enrolled": true,
        "campus_id": 2,
        "student": {
        "id": 24,
        "student_id": null,
        "username": "student_1",
        "email": "student_1@doubtfire.com",
        "first_name": "Layla",
        "last_name": "Kihn",
        "nickname": "student_1"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": true,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.53,
        "orange_pct": 0,
        "blue_pct": 0.03,
        "green_pct": 0.44,
        "order_scale": 47
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": 1
        }
        ]
    },
    {
        "id": 8,
        "enrolled": true,
        "campus_id": 3,
        "student": {
        "id": 30,
        "student_id": null,
        "username": "student_7",
        "email": "student_7@doubtfire.com",
        "first_name": "Monte",
        "last_name": "Waelchi",
        "nickname": "student_7"
        },
        "target_grade": 1,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.27,
        "orange_pct": 0.03,
        "blue_pct": 0.1,
        "green_pct": 0.6,
        "order_scale": 70.3
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": 2
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": null
        }
        ]
    },
    {
        "id": 3,
        "enrolled": true,
        "campus_id": 2,
        "student": {
        "id": 25,
        "student_id": null,
        "username": "student_2",
        "email": "student_2@doubtfire.com",
        "first_name": "Nan",
        "last_name": "Osinski",
        "nickname": "student_2"
        },
        "target_grade": 0,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.33,
        "orange_pct": 0.05,
        "blue_pct": 0.05,
        "green_pct": 0.57,
        "order_scale": 62.49999999999999
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": 1
        }
        ]
    },
    {
        "id": 1,
        "enrolled": true,
        "campus_id": 2,
        "student": {
        "id": 23,
        "student_id": null,
        "username": "student_0",
        "email": "student_0@doubtfire.com",
        "first_name": "Tonita",
        "last_name": "Feil",
        "nickname": "student_0"
        },
        "target_grade": 3,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": true,
        "has_portfolio": false,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.75,
        "orange_pct": 0,
        "blue_pct": 0.08,
        "green_pct": 0.17,
        "order_scale": 25
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": 1
        }
        ]
    },
    {
        "id": 4,
        "enrolled": true,
        "campus_id": 2,
        "student": {
        "id": 26,
        "student_id": null,
        "username": "student_3",
        "email": "student_3@doubtfire.com",
        "first_name": "William",
        "last_name": "Schamberger",
        "nickname": "student_3"
        },
        "target_grade": 1,
        "submitted_grade": null,
        "compile_portfolio": false,
        "grade": 0,
        "grade_rationale": null,
        "similarity_flag": false,
        "has_portfolio": true,
        "stats": {
        "red_pct": 0,
        "grey_pct": 0.43,
        "orange_pct": 0.03,
        "blue_pct": 0.07,
        "green_pct": 0.47,
        "order_scale": 54.3
        },
        "tutorial_enrolments": [
        {
            "stream_abbr": "wrkshop-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-1",
            "tutorial_id": null
        },
        {
            "stream_abbr": "cls-2",
            "tutorial_id": null
        },
        {
            "stream_abbr": "wrkshop-2",
            "tutorial_id": 1
        }
        ]
    }
    ]
    ```
