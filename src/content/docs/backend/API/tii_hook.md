---
title: Doubtfire API 
---

# List of Doubtfire 

# API: tii_hook
This markdown document provides detailed documentation for the "tii_hook" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "tii_hook" API has the following operations.
- **POST** /api/tii_hook

## Detail of Operations related to tii_hook.

### POST activity_types: Accept the TurnItIn EULA
POST /api/tii_hook

- URL: `api/tii_hook`
- Method: `POST`
- Parameters:

| Parameter           | Description     |Parameter Type| Data Type|Mandatory|
|---------------------|-----------------|------------|------------|----|
| X-Turnitin-Signature | Valdates server identity    | header| string| Yes|
|X-Turnitin-EventType         |	The name of the event type for this request  | header| string| Yes|


- Response:
`201 Created`: Accept the TurnItIn EULA

- Example Request:
  ```bash 
  curl -X POST --header 'Content-Type: application/json' --header 'Accept: text/error' --header 'X-Turnitin-Signature: <signature_value>' --header 'X-Turnitin-EventType: PDF_STATUS' 'http://localhost:3000/api/tii_hook'
  
  ```

- Response Body
  ```
  success: Accept the TurnItIn EULA
  ```