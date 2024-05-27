---
title: Doubtfire API 
---

# List of Doubtfire 

# API: Units
units : Operations about units

This markdown document provides detailed documentation for the "units" API endpoints, including their URLs, methods, parameters (if any), responses, and example requests using curl.

This "units" API has the following operations.

- **GET** /api/units/{id}/stats/task_completion_stats
- **GET** /api/units/{id}/stats/task_status_pct
- **GET** /api/units/{id}/stats/student_target_grade
- **GET** /api/units/{id}/grades
- **GET** /api/units/{id}/tasks/inbox
- **GET** /api/units/{id}/feedback
- **POST** /api/units/{id}/rollover
- **GET** /api/units
- **POST** /api/units
- **GET** /api/units/{id}
- **PUT** /api/units/{id}
- **DELETE** /api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}
- **POST** /api/units/{unit_id}/tutorials/{tutorial_abbr}/enrolments/{project_id}
- **DELETE** /api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}
- **PUT** /api/units/{unit_id}/tutorial_streams/{tutorial_stream_abbr}
- **POST** /api/units/{unit_id}/tutorial_streams
- **DELETE** /api/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}
- **PUT** /api/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments/{id}
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/tii_group_attachments
- **DELETE** /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources
- **POST** /api/units/{unit_id}/task_definitions/{task_def_id}/task_assessment_resources
- **DELETE** /api/units/{unit_id}/task_definitions/{task_def_id}/task_resources
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/task_resources
- **POST** /api/units/{unit_id}/task_definitions/{task_def_id}/task_resources
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/task_pdf
- **GET** /api/units/{unit_id}/task_definitions/{task_def_id}/tasks
- **POST** /api/units/{unit_id}/task_definitions/task_pdfs
- **DELETE** /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet
- **POST** /api/units/{unit_id}/task_definitions/{task_def_id}/task_sheet
- **POST** /api/units/{unit_id}/task_definitions/{task_def_id}/test_overseer_assessment
- **DELETE** /api/units/{unit_id}/task_definitions/{id}
- **PUT** /api/units/{unit_id}/task_definitions/{id}
- **POST** /api/units/{unit_id}/task_definitions
- **GET** /api/units/{unit_id}/learning_alignments/class_details
- **GET** /api/units/{unit_id}/learning_alignments/class_stats
- **DELETE** /api/units/{unit_id}/learning_alignments/{id}
- **PUT** /api/units/{unit_id}/learning_alignments/{id}
- **GET** /api/units/{unit_id}/learning_alignments
- **POST** /api/units/{unit_id}/learning_alignments
- **GET** /api/units/{unit_id}/learning_alignments/csv
- **POST** /api/units/{unit_id}/learning_alignments/csv
- **GET** /api/units/{unit_id}/outcomes/csv
- **POST** /api/units/{unit_id}/outcomes/csv
- **DELETE** /api/units/{unit_id}/outcomes/{id}
- **PUT** /api/units/{unit_id}/outcomes/{id}
- **POST** /api/units/{unit_id}/outcomes
- **DELETE** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{id}
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members/{project_id}
- **GET** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}/members
- **DELETE** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}
- **PUT** /api/units/{unit_id}/group_sets/{group_set_id}/groups/{group_id}
- **GET** /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups/student_csv
- **GET** /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups/csv
- **POST** /api/units/{unit_id}/group_sets/{group_set_id}/groups
- **GET** /api/units/{unit_id}/group_sets/{id}/groups
- **DELETE** /api/units/{unit_id}/group_sets/{id}
- **PUT** /api/units/{unit_id}/group_sets/{id}
- **POST** /api/units/{unit_id}/group_sets


## Following pages list detailed Operations related to units API