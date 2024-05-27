---
title: Doubtfire API 
---

# List of Doubtfire 

# API: users 
users : Operations about users
This markdown document provides detailed documentation for the "users" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "users" API has the following operations.

- **GET** /api/users
- **POST** /api/users
- **GET** /api/users/{id}
- **PUT** /api/users/{id}
- **GET** /api/users/tutors
- **GET** /api/users/convenors

## Detail of Operations related to users.

### GET: Get the list of users
GET /api/users

- URL: `/api/users`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/users'
    ```
- Response body: 
    ```json
        [
        {
            "id": 1,
            "student_id": null,
            "email": "aadmin@doubtfire.com",
            "first_name": "Admin",
            "last_name": "Admin",
            "username": "aadmin",
            "nickname": "Admin",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Admin"
        },
        {
            "id": 2,
            "student_id": null,
            "email": "acain@doubtfire.com",
            "first_name": "Andrew",
            "last_name": "Cain",
            "username": "acain",
            "nickname": "Macite",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Admin"
        },
        {
            "id": 3,
            "student_id": null,
            "email": "aconvenor@doubtfire.com",
            "first_name": "Clinton",
            "last_name": "Woodward",
            "username": "aconvenor",
            "nickname": "The Giant",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Convenor"
        },
        {
            "id": 4,
            "student_id": null,
            "email": "ajones@doubtfire.com",
            "first_name": "Allan",
            "last_name": "Jones",
            "username": "ajones",
            "nickname": "P-Jiddy",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Admin"
        },
        {
            "id": 5,
            "student_id": null,
            "email": "rwilson@doubtfire.com",
            "first_name": "Reuben",
            "last_name": "Wilson",
            "username": "rwilson",
            "nickname": "Reubs",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Convenor"
        },
        {
            "id": 6,
            "student_id": null,
            "email": "atutor@doubtfire.com",
            "first_name": "Akihiro",
            "last_name": "Noguchi",
            "username": "atutor",
            "nickname": "Animations",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 7,
            "student_id": null,
            "email": "acummaudo@doubtfire.com",
            "first_name": "Alex",
            "last_name": "Cummaudo",
            "username": "acummaudo",
            "nickname": "DoubtfireDude",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Convenor"
        },
        {
            "id": 8,
            "student_id": null,
            "email": "cliff@doubtfire.com",
            "first_name": "Cliff",
            "last_name": "Warren",
            "username": "cliff",
            "nickname": "Cliff",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 9,
            "student_id": null,
            "email": "joostfunkekupper@doubtfire.com",
            "first_name": "Joost",
            "last_name": "Funke Kupper",
            "username": "joostfunkekupper",
            "nickname": "Joe",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 10,
            "student_id": null,
            "email": "angusmorton@doubtfire.com",
            "first_name": "Angus",
            "last_name": "Morton",
            "username": "angusmorton",
            "nickname": "Angus",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 11,
            "student_id": null,
            "email": "123456x@doubtfire.com",
            "first_name": "Fred",
            "last_name": "Jones",
            "username": "123456x",
            "nickname": "Foo",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 12,
            "student_id": null,
            "email": "astudent@doubtfire.com",
            "first_name": "student",
            "last_name": "surname",
            "username": "astudent",
            "nickname": "Foo",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 13,
            "student_id": null,
            "email": "tutor_0@doubtfire.com",
            "first_name": "Karon",
            "last_name": "Kutch",
            "username": "tutor_0",
            "nickname": "tutor_0",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 14,
            "student_id": null,
            "email": "tutor_1@doubtfire.com",
            "first_name": "Scottie",
            "last_name": "Hermiston",
            "username": "tutor_1",
            "nickname": "tutor_1",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 15,
            "student_id": null,
            "email": "tutor_2@doubtfire.com",
            "first_name": "Porfirio",
            "last_name": "Ortiz",
            "username": "tutor_2",
            "nickname": "tutor_2",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 16,
            "student_id": null,
            "email": "tutor_3@doubtfire.com",
            "first_name": "Kayce",
            "last_name": "Kassulke",
            "username": "tutor_3",
            "nickname": "tutor_3",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 17,
            "student_id": null,
            "email": "tutor_4@doubtfire.com",
            "first_name": "Kristofer",
            "last_name": "Schoen",
            "username": "tutor_4",
            "nickname": "tutor_4",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 18,
            "student_id": null,
            "email": "tutor_5@doubtfire.com",
            "first_name": "Granville",
            "last_name": "Howell",
            "username": "tutor_5",
            "nickname": "tutor_5",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 19,
            "student_id": null,
            "email": "tutor_6@doubtfire.com",
            "first_name": "Harry",
            "last_name": "O'Hara",
            "username": "tutor_6",
            "nickname": "tutor_6",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 20,
            "student_id": null,
            "email": "tutor_7@doubtfire.com",
            "first_name": "Valorie",
            "last_name": "Herzog",
            "username": "tutor_7",
            "nickname": "tutor_7",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 21,
            "student_id": null,
            "email": "tutor_8@doubtfire.com",
            "first_name": "Russel",
            "last_name": "McCullough",
            "username": "tutor_8",
            "nickname": "tutor_8",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 22,
            "student_id": null,
            "email": "tutor_9@doubtfire.com",
            "first_name": "Billie",
            "last_name": "Pagac",
            "username": "tutor_9",
            "nickname": "tutor_9",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        },
        {
            "id": 23,
            "student_id": null,
            "email": "student_0@doubtfire.com",
            "first_name": "Tonita",
            "last_name": "Feil",
            "username": "student_0",
            "nickname": "student_0",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 24,
            "student_id": null,
            "email": "student_1@doubtfire.com",
            "first_name": "Layla",
            "last_name": "Kihn",
            "username": "student_1",
            "nickname": "student_1",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 25,
            "student_id": null,
            "email": "student_2@doubtfire.com",
            "first_name": "Nan",
            "last_name": "Osinski",
            "username": "student_2",
            "nickname": "student_2",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 26,
            "student_id": null,
            "email": "student_3@doubtfire.com",
            "first_name": "William",
            "last_name": "Schamberger",
            "username": "student_3",
            "nickname": "student_3",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 27,
            "student_id": null,
            "email": "student_4@doubtfire.com",
            "first_name": "Emanuel",
            "last_name": "Kutch",
            "username": "student_4",
            "nickname": "student_4",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 28,
            "student_id": null,
            "email": "student_5@doubtfire.com",
            "first_name": "Dale",
            "last_name": "Homenick",
            "username": "student_5",
            "nickname": "student_5",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 29,
            "student_id": null,
            "email": "student_6@doubtfire.com",
            "first_name": "Gracia",
            "last_name": "Heathcote",
            "username": "student_6",
            "nickname": "student_6",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 30,
            "student_id": null,
            "email": "student_7@doubtfire.com",
            "first_name": "Monte",
            "last_name": "Waelchi",
            "username": "student_7",
            "nickname": "student_7",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 31,
            "student_id": null,
            "email": "student_8@doubtfire.com",
            "first_name": "John",
            "last_name": "Padberg",
            "username": "student_8",
            "nickname": "student_8",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 32,
            "student_id": null,
            "email": "student_9@doubtfire.com",
            "first_name": "Juan",
            "last_name": "Daugherty",
            "username": "student_9",
            "nickname": "student_9",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 33,
            "student_id": null,
            "email": "student_10@doubtfire.com",
            "first_name": "Herbert",
            "last_name": "Flatley",
            "username": "student_10",
            "nickname": "student_10",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 34,
            "student_id": null,
            "email": "student_11@doubtfire.com",
            "first_name": "Geraldo",
            "last_name": "Rutherford",
            "username": "student_11",
            "nickname": "student_11",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 35,
            "student_id": null,
            "email": "student_12@doubtfire.com",
            "first_name": "Jordon",
            "last_name": "Pagac",
            "username": "student_12",
            "nickname": "student_12",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 36,
            "student_id": null,
            "email": "student_13@doubtfire.com",
            "first_name": "Georgeanna",
            "last_name": "Fay",
            "username": "student_13",
            "nickname": "student_13",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 37,
            "student_id": null,
            "email": "student_14@doubtfire.com",
            "first_name": "Idalia",
            "last_name": "Smith",
            "username": "student_14",
            "nickname": "student_14",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 38,
            "student_id": null,
            "email": "student_15@doubtfire.com",
            "first_name": "Krystal",
            "last_name": "Crooks",
            "username": "student_15",
            "nickname": "student_15",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 39,
            "student_id": null,
            "email": "student_16@doubtfire.com",
            "first_name": "Kenny",
            "last_name": "Blanda",
            "username": "student_16",
            "nickname": "student_16",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 40,
            "student_id": null,
            "email": "student_17@doubtfire.com",
            "first_name": "Kathey",
            "last_name": "Heathcote",
            "username": "student_17",
            "nickname": "student_17",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        },
        {
            "id": 41,
            "student_id": null,
            "email": "tsdummy@doubtfire.com",
            "first_name": "First Name",
            "last_name": "Surname",
            "username": "tsdummy",
            "nickname": "Nickname",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Student"
        }
        ]
    ```

### POST: Create user
POST /api/users

- URL: `/api/users`
- Method: `POST`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |user [first_name] | New first name for user | formData | string |Yes|
    |user [last_name] | New last name for user | formData | string |Yes|
    |user [email] | New email address for user | formData | string |Yes|
    |user [student_id] | New student_id for user | formData | string ||
    |user [username] | New username for user | formData | string |Yes|
    |user [nickname] | New nickname for user | formData | string |Yes|
    |user [system_role]	 | New system role for user [Admin, Convenor, Tutor, Student] | formData | string |Yes|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response:
`200 OK`

- Example Request: 
    ```bash
    curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' -d 'user%5Bfirst_name%5D=Ronny&user%5Blast_name%5D=Jackson&user%5Bemail%5D=ron.jackson%40dummyemail.com&user%5Busername%5D=rjack&user%5Bnickname%5D=ron&user%5Bsystem_role%5D=tutor' 'http://localhost:3000/api/users'
    ```
- Response body
    ```json
        {
            "id": 43,
            "student_id": null,
            "email": "ron.jackson@dummyemail.com",
            "first_name": "Ronny",
            "last_name": "Jackson",
            "username": "rjack",
            "nickname": "ron",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Tutor"
        }
    ```



### GET: Get user
GET /api/users/{id}

- URL: `/api/users/{id}`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    |id | | path | integer|Yes|

- Response:
`201 Created`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/users/39'
    ```
- Response body: 
    ```json
    {
        "id": 39,
        "student_id": null,
        "email": "student_16@doubtfire.com",
        "first_name": "Kenny",
        "last_name": "Blanda",
        "username": "student_16",
        "nickname": "student_16",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Student"
    }
    ```

### PUT: Update a user
PUT /api/users/{id}

- URL: `/api/users/{id}`
- Method: `PUT`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |id | The user id to update | path | integer |Yes|
    |user [first_name] | New first name for user | formData | string ||
    |user [last_name] | New last name for user | formData | string ||
    |user [email] | New email address for user | formData | string ||
    |user [student_id] | New student_id for user | formData | string ||
    |user [nickname] | New nickname for user | formData | string ||
    |user [system_role]	 | New system role for user [Admin, Convenor, Tutor, Student] | formData | string ||
    |user [receive_task_notifications] | Allow user to be sent task notifications | formData | boolean ||
    |user [receive_portfolio_notifications] | Allow user to be sent portfolio notifications | formData | boolean ||
    |user [receive_feedback_notifications]	 | 	Allow user to be sent feedback notifications | formData | boolean ||
    |user [opt_in_to_research]	 | Allow user to opt in to research conducted by Doubtfire | formData | boolean ||
    |user [has_run_first_time_setup]	 | Whether or not user has run first-time setup | formData | boolean ||
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|
    

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X PUT --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' -d 'user%5Bnickname%5D=ronny&user%5Breceive_task_notifications%5D=true&user%5Breceive_portfolio_notifications%5D=true&user%5Breceive_feedback_notifications%5D=true' 'http://localhost:3000/api/users/43'
    ```
- Response body: 
    ```json
    {
        "id": 43,
        "student_id": null,
        "email": "ron.jackson@dummyemail.com",
        "first_name": "Ronny",
        "last_name": "Jackson",
        "username": "rjack",
        "nickname": "ronny",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    }
    ```

### GET: Get the list of tutors
GET /api/users/tutors

- URL: `/api/users/tutors`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/users/tutors'
    ```
- Response body: 
    ```json
    [
    {
        "id": 6,
        "student_id": null,
        "email": "atutor@doubtfire.com",
        "first_name": "Akihiro",
        "last_name": "Noguchi",
        "username": "atutor",
        "nickname": "Animations",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 8,
        "student_id": null,
        "email": "cliff@doubtfire.com",
        "first_name": "Cliff",
        "last_name": "Warren",
        "username": "cliff",
        "nickname": "Cliff",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 9,
        "student_id": null,
        "email": "joostfunkekupper@doubtfire.com",
        "first_name": "Joost",
        "last_name": "Funke Kupper",
        "username": "joostfunkekupper",
        "nickname": "Joe",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 10,
        "student_id": null,
        "email": "angusmorton@doubtfire.com",
        "first_name": "Angus",
        "last_name": "Morton",
        "username": "angusmorton",
        "nickname": "Angus",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 13,
        "student_id": null,
        "email": "tutor_0@doubtfire.com",
        "first_name": "Karon",
        "last_name": "Kutch",
        "username": "tutor_0",
        "nickname": "tutor_0",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 14,
        "student_id": null,
        "email": "tutor_1@doubtfire.com",
        "first_name": "Scottie",
        "last_name": "Hermiston",
        "username": "tutor_1",
        "nickname": "tutor_1",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 15,
        "student_id": null,
        "email": "tutor_2@doubtfire.com",
        "first_name": "Porfirio",
        "last_name": "Ortiz",
        "username": "tutor_2",
        "nickname": "tutor_2",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 16,
        "student_id": null,
        "email": "tutor_3@doubtfire.com",
        "first_name": "Kayce",
        "last_name": "Kassulke",
        "username": "tutor_3",
        "nickname": "tutor_3",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 17,
        "student_id": null,
        "email": "tutor_4@doubtfire.com",
        "first_name": "Kristofer",
        "last_name": "Schoen",
        "username": "tutor_4",
        "nickname": "tutor_4",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 18,
        "student_id": null,
        "email": "tutor_5@doubtfire.com",
        "first_name": "Granville",
        "last_name": "Howell",
        "username": "tutor_5",
        "nickname": "tutor_5",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 19,
        "student_id": null,
        "email": "tutor_6@doubtfire.com",
        "first_name": "Harry",
        "last_name": "O'Hara",
        "username": "tutor_6",
        "nickname": "tutor_6",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 20,
        "student_id": null,
        "email": "tutor_7@doubtfire.com",
        "first_name": "Valorie",
        "last_name": "Herzog",
        "username": "tutor_7",
        "nickname": "tutor_7",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 21,
        "student_id": null,
        "email": "tutor_8@doubtfire.com",
        "first_name": "Russel",
        "last_name": "McCullough",
        "username": "tutor_8",
        "nickname": "tutor_8",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 22,
        "student_id": null,
        "email": "tutor_9@doubtfire.com",
        "first_name": "Billie",
        "last_name": "Pagac",
        "username": "tutor_9",
        "nickname": "tutor_9",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 43,
        "student_id": null,
        "email": "ron.jackson@dummyemail.com",
        "first_name": "Ronny",
        "last_name": "Jackson",
        "username": "rjack",
        "nickname": "ronny",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Tutor"
    },
    {
        "id": 3,
        "student_id": null,
        "email": "aconvenor@doubtfire.com",
        "first_name": "Clinton",
        "last_name": "Woodward",
        "username": "aconvenor",
        "nickname": "The Giant",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Convenor"
    },
    {
        "id": 5,
        "student_id": null,
        "email": "rwilson@doubtfire.com",
        "first_name": "Reuben",
        "last_name": "Wilson",
        "username": "rwilson",
        "nickname": "Reubs",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Convenor"
    },
    {
        "id": 7,
        "student_id": null,
        "email": "acummaudo@doubtfire.com",
        "first_name": "Alex",
        "last_name": "Cummaudo",
        "username": "acummaudo",
        "nickname": "DoubtfireDude",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Convenor"
    },
    {
        "id": 1,
        "student_id": null,
        "email": "aadmin@doubtfire.com",
        "first_name": "Admin",
        "last_name": "Admin",
        "username": "aadmin",
        "nickname": "Admin",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Admin"
    },
    {
        "id": 2,
        "student_id": null,
        "email": "acain@doubtfire.com",
        "first_name": "Andrew",
        "last_name": "Cain",
        "username": "acain",
        "nickname": "Macite",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Admin"
    },
    {
        "id": 4,
        "student_id": null,
        "email": "ajones@doubtfire.com",
        "first_name": "Allan",
        "last_name": "Jones",
        "username": "ajones",
        "nickname": "P-Jiddy",
        "receive_task_notifications": true,
        "receive_portfolio_notifications": true,
        "receive_feedback_notifications": true,
        "opt_in_to_research": null,
        "has_run_first_time_setup": false,
        "system_role": "Admin"
    }
    ]
    ```

### GET: Get convenors
GET /api/users/convenors

- URL: `/api/users/convenors`
- Method: `GET`
- Parameters: 
    | Parameter           | Description     |Parameter Type| Data Type|Mandatory|
    |---------------------|-----------------|------------|------------|---|
    |Username | User username | header | string |Yes|
    |Auth_Token | Authentication token | header | string |Yes|

- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' --header 'Username: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/users/convenors'ame: aadmin' --header 'Auth_Token: vs61XXKdACADRUfQBWzr' 'http://localhost:3000/api/users/tutors'
    ```
- Response body: 
    ```json
        [
        {
            "id": 3,
            "student_id": null,
            "email": "aconvenor@doubtfire.com",
            "first_name": "Clinton",
            "last_name": "Woodward",
            "username": "aconvenor",
            "nickname": "The Giant",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Convenor"
        },
        {
            "id": 5,
            "student_id": null,
            "email": "rwilson@doubtfire.com",
            "first_name": "Reuben",
            "last_name": "Wilson",
            "username": "rwilson",
            "nickname": "Reubs",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Convenor"
        },
        {
            "id": 7,
            "student_id": null,
            "email": "acummaudo@doubtfire.com",
            "first_name": "Alex",
            "last_name": "Cummaudo",
            "username": "acummaudo",
            "nickname": "DoubtfireDude",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Convenor"
        },
        {
            "id": 1,
            "student_id": null,
            "email": "aadmin@doubtfire.com",
            "first_name": "Admin",
            "last_name": "Admin",
            "username": "aadmin",
            "nickname": "Admin",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Admin"
        },
        {
            "id": 2,
            "student_id": null,
            "email": "acain@doubtfire.com",
            "first_name": "Andrew",
            "last_name": "Cain",
            "username": "acain",
            "nickname": "Macite",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Admin"
        },
        {
            "id": 4,
            "student_id": null,
            "email": "ajones@doubtfire.com",
            "first_name": "Allan",
            "last_name": "Jones",
            "username": "ajones",
            "nickname": "P-Jiddy",
            "receive_task_notifications": true,
            "receive_portfolio_notifications": true,
            "receive_feedback_notifications": true,
            "opt_in_to_research": null,
            "has_run_first_time_setup": false,
            "system_role": "Admin"
        }
        ]
    ```