---
title: Requirements Document
---

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to outline the requirements for the backend development of the "Tutor Times" feature. This feature enables tutors to log and track their marking contributions, which are aggregated at the task and unit levels.

### 1.2 Scope

The scope of this document covers the backend implementation of Tutor Times, including API design, database schema, data aggregation logic, and integrations with frontend components.

### 1.3 Intended Audience

This document is intended for backend developers and technical leads involved in implementing and maintaining the Tutor Times feature.

---

## 2. Functional Requirements

### 2.1 Data Storage

- Create a new table `tutor_time` to store time contributions by tutors.
- Each record should include:

  - `id` (primary key)
  - `unit_role_id` (references tutor's role in a unit)
  - `task_id` (references the specific marking task)
  - `block_count` (integer, number of 5-minute blocks)
  - `created_at` (timestamp)
  - `deleted_at` (nullable timestamp for soft-deletion)

- Allow multiple block entries per tutor per task.
- Support efficient querying and indexing on `unit_role_id`, `task_id`, and `created_at`.

- Add a new column `total_tutor_time` (integer, number of 5-minute blocks) to the `units` table.

### 2.2 API Endpoints

Provide the following RESTful API endpoints:

| Endpoint                                  | Method   | Description                                                              |
| ----------------------------------------- | -------- | ------------------------------------------------------------------------ |
| `/api/tutor-time`                         | `POST`   | Create a new tutor time block (e.g., `block_count: 3`).                  |
| `/api/tutor-time/:id`                     | `GET`    | Retrieve a specific time block entry.                                    |
| `/api/tutor-time/:id`                     | `PUT`    | Update a specific time block entry.                                      |
| `/api/tutor-time/:id`                     | `DELETE` | Soft-delete a time block using the `deleted_at` field.                   |
| `/api/tutor-time/unit-role/:unit_role_id` | `GET`    | Retrieve all time block entries for a given unit role.                   |
| `/api/tutor-time/unit/:unit_id`           | `GET`    | Retrieve all time block entries for a given unit, across all unit roles. |

### 2.3 Authentication and Authorization

- Require valid authentication via session tokens.
- Tutors may only access and modify their own block entries.
- Unit chairs may view block entries related to their unit(s).

### 2.4 Background Jobs and Triggers

- Create background jobs or triggers to:
  - Automatically **recalculate `total_tutor_time`** for a unit when a `tutor_time` record is added, deleted, or restored.
  - Only include non-deleted entries in aggregation.

---

## 3. Non-Functional Requirements

### 3.1 Performance

- Use appropriate indexing for filtering by `unit_role_id`, `task_id`, and `created_at`.

### 3.2 Security

- Enforce strict access control based on user roles.
- Use encrypted connections for all API traffic.
- Audit and log access where appropriate.

---

## 4. User Stories

### 4.1 As a tutor...

- I want to log the time I’ve spent marking in small increments, so I can record my contributions easily.

### 4.2 As a tutor...

- I want to see how much time I’ve spent on each task and unit, so I can track my workload.

### 4.3 As a unit chair...

- I want to see how much marking time tutors are contributing to each unit, so I can monitor progress and reporting.

---

## 5. Database Schema

### 5.1 Tables and Fields

#### `tutor_times`

| Column         | Type     | Notes                                   |
| -------------- | -------- | --------------------------------------- |
| `id`           | bigint   | Primary key                             |
| `unit_role_id` | bigint   | FK to `unit_roles`                      |
| `task_id`      | bigint   | FK to `tasks`                           |
| `block_count`  | integer  | Number of 5-minute blocks (must be ≥ 1) |
| `created_at`   | datetime | Auto-generated                          |
| `deleted_at`   | datetime | Nullable; for soft-deletion             |

#### `units`

| Column             | Type    | Notes                                                            |
| ------------------ | ------- | ---------------------------------------------------------------- |
| `total_tutor_time` | integer | Total number of 5-minute blocks; auto-updated from block entries |

### 5.2 Relationships

- `unit_roles (id)` → `tutor_time_blocks (unit_role_id)` (many-to-one)
- `tasks (id)` → `tutor_time_blocks (task_id)` (many-to-one)
- `unit_roles` → `units`: Each role is tied to a unit, allowing aggregation

### 5.3 Data Integrity Constraints

- `block_count` must be a positive integer (≥ 1)
- All aggregation only includes non-deleted entries

---

## 6. Testing Requirements

### 6.1 Unit Testing

- Unit test all API endpoints.
- Validate correct behavior when block entries are created or deleted.
- Test recalculation of `total_tutor_time` after insertions and deletions.

---
