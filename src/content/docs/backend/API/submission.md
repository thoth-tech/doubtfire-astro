---
title: Doubtfire API
---

# API: Submission

submission : Operations about submission
This markdown document provides detailed documentation for the "submission" API endpoints including their URLs, methods, parameters, responses, and example requests using curl.

This "submission" API has the following operations.

- **GET**: /api/submission/assess
- **POST**: /api/submission/assess
- **DELETE**: /api/submission/project/{id}/portfolio
- **GET**: /api/submission/project/{id}/portfolio
- **POST**: /api/submission/project/{id}/portfolio

## Detail of Operations related to submission.

### GET: Retrieve Submissions Ready to Mark

GET /api/submission/assess

- URL: `/api/submission/assess`
- Method: `GET`
- Parameters:

  | Parameter  | Description                                    | Parameter Type | Data Type | Mandatory |
  | ---------- | ---------------------------------------------- | -------------- | --------- | --------- |
  | unit_id    | Unit ID to retrieve submissions for            | query          | integer   | Yes       |
  | user_id    | User ID to retrieve submissions for (optional) | query          | integer   | No        |
  | Username   | User username                                  | header         | string    | Yes       |
  | Auth_Token | Authentication token                           | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:
  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/submission/assess?unit_id=1&user_id=2'
  ```
- Response Body:
  This endpoint returns a zip file containing the tasks ready for marking. The response does not have a JSON body.

---

### POST: Upload Submission Documents

POST /api/submission/assess

- URL: `/api/submission/assess`
- Method: `POST`
- Parameters:

  | Parameter  | Description                                        | Parameter Type | Data Type | Mandatory |
  | ---------- | -------------------------------------------------- | -------------- | --------- | --------- |
  | file       | Batch file upload                                  | body           | file      | Yes       |
  | unit_id    | Unit ID to upload marked submissions to            | body           | integer   | Yes       |
  | user_id    | User ID to upload marked submissions to (optional) | body           | integer   | No        |
  | Username   | User username                                      | header         | string    | Yes       |
  | Auth_Token | Authentication token                               | header         | string    | Yes       |

- Response:
  `201`

- Example Request:
  ```bash
  curl -X POST --header 'Content-Type: multipart/form-data' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' -F 'file=@path_to_your_file' -F 'unit_id=1' -F 'user_id=2' 'http://localhost:3000/api/submission/assess'
  ```
- Response Body:
  ```json
  {
    "message": "Batch upload successful"
  }
  ```

---

### POST: Upload Portfolio Document

POST /api/submission/project/{id}/portfolio

- URL: `/api/submission/project/{id}/portfolio`
- Method: `POST`
- Parameters:

  | Parameter  | Description                                               | Parameter Type | Data Type | Mandatory |
  | ---------- | --------------------------------------------------------- | -------------- | --------- | --------- |
  | name       | Name of the part being uploaded                           | body           | string    | Yes       |
  | kind       | The kind of file being uploaded: document, code, or image | body           | string    | Yes       |
  | file0      | The file being uploaded                                   | body           | file      | Yes       |
  | Username   | User username                                             | header         | string    | Yes       |
  | Auth_Token | Authentication token                                      | header         | string    | Yes       |

- Response:
  `201`

- Example Request:

  ```bash
  curl -X POST --header 'Content-Type: multipart/form-data' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' -F 'name=Part 1' -F 'kind=document' -F 'file0=@path_to_your_file' 'http://localhost:3000/api/submission/project/1/portfolio'
  ```

- Response Body:
  ```json
  {
    "file_name": "Part 1",
    "file_kind": "document",
    "file_path": "path_to_file"
  }
  ```

---

### DELETE: Remove Portfolio Document

DELETE /api/submission/project/{id}/portfolio

- URL: `/api/submission/project/{id}/portfolio`
- Method: `DELETE`
- Parameters:

  | Parameter  | Description                                                         | Parameter Type | Data Type | Mandatory |
  | ---------- | ------------------------------------------------------------------- | -------------- | --------- | --------- |
  | id         | Project ID                                                          | path           | integer   | Yes       |
  | idx        | The index of the file (optional)                                    | query          | integer   | No        |
  | kind       | The kind of file being removed: document, code, or image (optional) | query          | string    | No        |
  | name       | Name of file to remove (optional)                                   | query          | string    | No        |
  | Username   | User username                                                       | header         | string    | Yes       |
  | Auth_Token | Authentication token                                                | header         | string    | Yes       |

- Response:
  `204`

- Example Request:
  ```bash
  curl -X DELETE --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/submission/project/1/portfolio?idx=0&kind=document&name=Part 1'
  ```
- Response Body:
  `Portfolio deleted `

---

### GET: Retrieve Portfolio

GET /api/submission/project/{id}/portfolio

- URL: `/api/submission/project/{id}/portfolio`
- Method: `GET`
- Parameters:

  | Parameter     | Description                                              | Parameter Type | Data Type | Mandatory |
  | ------------- | -------------------------------------------------------- | -------------- | --------- | --------- |
  | id            | Project ID                                               | path           | integer   | Yes       |
  | as_attachment | Whether or not to download file as attachment (optional) | query          | boolean   | No        |
  | Username      | User username                                            | header         | string    | Yes       |
  | Auth_Token    | Authentication token                                     | header         | string    | Yes       |

- Response:
  `200 OK`

- Example Request:

  ```bash
  curl -X GET --header 'Accept: application/json' --header 'Username: admin' --header 'Auth_Token: rrK8BdRfxof9RrJGuk5n' 'http://localhost:3000/api/submission/project/1/portfolio?as_attachment=true'
  ```

- Response Body:
  This endpoint returns a PDF file of the portfolio. The response does not have a JSON body.
