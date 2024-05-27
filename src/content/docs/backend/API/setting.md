---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Setting
setting : Operations about setting
This markdown document provides detailed documentation for the "setting" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "setting" API has the following operations.
- **GET** /api/settings/privacy
- **GET** /api/settings


## Detail of Operations related to setting.

### GET: Return privacy policy details
GET /api/settings/privacy

- URL: `/api/settings/privacy`
- Method: `GET`
- Parameters: None   
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/settings/privacy'
    ```
- Response body: 
    ```json
    {
        "privacy": "By clicking on the Upload button, I certify that the attached work is entirely my own (or where submitted to meet the requirements of an approved group assignment is the work of the group), except where work quoted or paraphrased is acknowledged in the text. I also certify that it has not been previously submitted for assessment in this or any other unit or course unless permission for this has been granted by the teaching staff coordinating this unit. I agree that the University may make and retain copies of this work for the purposes of marking and review, and may submit this work to an external plagiarism and collusion detection service who may retain a copy for future plagiarism and collusion detection but will not release it or use it for any other purpose.",
        "plagiarism": "Plagiarism and collusion constitute extremely serious academic misconduct. They are forms of cheating, and severe penalties are associated with them, including cancellation of marks for a specific assignment, for a specific unit or even exclusion from the course. If you are ever in doubt about how to cite a reference properly, consult your lecturer or the Study Support website Plagiarism occurs when a student passes off as the student’s own work, or copies without acknowledgement as to its authorship, the work of any other person. Collusion occurs when a student obtains the agreement of another person for a fraudulent purpose, with the intent of obtaining an advantage in submitting an assignment or other work. Work submitted may be reproduced and/or communicated by the university for the purpose of detecting plagiarism and collusion. Students are reminded that assessment work, or parts of assessment work, cannot be re-submitted for a different assessment task in the same unit or any other unit, without the approval from the teaching staff involved. This includes work submitted for assessment at another academic institution. If students wish to reuse or extend parts of previously submitted work then they should discuss this with the teaching staff prior to the submission date. Depending on the nature of the task, the teaching staff may permit or decline the request."
    }
    ```

### GET: Return configurable details for the Doubtfire front end
GET /api/settings

- URL: `/api/settings`
- Method: `GET`
- Parameters: None   
- Response:
`200 OK`

- Example Request:
    ```bash
    curl -X GET --header 'Accept: application/json' 'http://localhost:3000/api/settings'
    ```
- Response body: 
    ```json
    {
        "externalName": "OnTrack",
        "overseerEnabled": false,
        "tiiEnabled": false
    }
    ```
