---
title: Requirements Document
---

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to outline the requirements for the backend development of the "Tutor Times" feature. This feature enables the automatic tracking, storage, and retrieval of marking time data for tutors at both the task and unit levels.

### 1.2 Scope

The scope of this document covers the backend implementation of Tutor Times, including API design, database schema, session lifecycle logic, aggregation of data, and integrations with frontend components.

### 1.3 Intended Audience

This document is intended for backend developers and technical leads involved in implementing and maintaining the Tutor Times feature.

---

## 2. Functional Requirements

### 2.1 Data Storage

- Create a new table `tutor_times` to store individual marking session data.
- Each record should include:

  - `id` (primary key)
  - `unit_role_id` (references tutor's role in a unit)
  - `task_id` (references the specific marking task; required for all sessions)
  - `start_time` (timestamp)
  - `end_time` (timestamp)
  - `status` (enum: `active`, `paused`, `completed`)
  - `duration_seconds` (integer, calculated on session completion)
  - `created_at`, `updated_at` (timestamps)
  - `deleted_at` (nullable timestamp for soft-deletion)

- Allow multiple sessions per tutor per day.
- Support efficient querying and indexing on `unit_role_id`, `task_id`, and `status`.

- Add a new column `total_tutor_time` (integer, in seconds) to the `units` table.

### 2.2 API Endpoints

Provide the following RESTful API endpoints:

| Endpoint                                   | Method   | Description                                                                   |
| ------------------------------------------ | -------- | ----------------------------------------------------------------------------- |
| `/api/tutor-times/start`                   | `POST`   | Start a new marking session.                                                  |
| `/api/tutor-times/:id/pause`               | `PUT`    | Pause a session.                                                              |
| `/api/tutor-times/:id/resume`              | `PUT`    | Resume a previously paused session.                                           |
| `/api/tutor-times/:id/complete`            | `PUT`    | End a session. Calculates and stores `duration_seconds`.                      |
| `/api/tutor-times/:id`                     | `GET`    | Retrieve a specific session.                                                  |
| `/api/tutor-times/unit-role/:unit_role_id` | `GET`    | Retrieve all sessions for a given unit role.                                  |
| `/api/tutor-times/:id`                     | `DELETE` | Soft-delete a session using `deleted_at` field.                               |
| `/api/tutor-times/unit/:unit_id`           | `GET`    | (Optional) Retrieve all sessions related to a unit via associated unit roles. |

### 2.3 Authentication and Authorization

- Require valid authentication via session tokens.
- Tutors may only access and modify their own sessions.
- Unit chairs may view sessions related to their unit(s) for reporting purposes.
- Admin-level users may view and manage all sessions (for debugging or audit purposes)

### 2.4 Background Jobs and Triggers

- Create background jobs or triggers to:
  - Automatically **recalculate `total_tutor_time`** for a unit in the `units` table when a `tutor_times` record is added, updated, soft-deleted, or restored.
  - Ensure that only non-deleted, completed sessions are included.

### 2.5 Session Timeout Logic

- Automatically **pause a session after 10 minutes** of inactivity.
- Inactivity is tracked via frontend user interactions (e.g. navigation, scrolling, mouse movement).
- The frontend is responsible for detecting inactivity and calling the `pause` endpoint.
- Session can be resumed via the `resume` endpoint, maintaining continuity.

---

## 3. Non-Functional Requirements

### 3.1 Performance

- Use appropriate indexing for filtering by `unit_role_id`, `task_id`, and `status`.

### 3.2 Security

- Enforce strict access control based on user roles.
- Use encrypted connections for all API traffic.
- Secure sensitive fields and audit user access where applicable.

---

## 4. User Stories

### 4.1 As a tutor...

- I want my marking time to start tracking automatically when I land on the task inbox, so I don’t need to manually start a timer.

### 4.2 As a tutor...

- I want the timer to pause automatically when I’m inactive for 10 minutes, so that idle time isn’t counted in my marking duration.

### 4.3 As a tutor...

- I want to be able to resume marking time with a button click, so I can pick up where I left off if I was idle.

### 4.4 As a tutor...

- I want to see how much time I’ve spent marking each task and unit, so I can track and reflect on my workload.

### 4.5 As a tutor...

- I want to view useful stats like total time spent per task.

---

## 5. Database Schema

### 5.1 Tables and Fields

#### `tutor_times`

| Column             | Type     | Notes                                              |
| ------------------ | -------- | -------------------------------------------------- |
| `id`               | UUID     | Primary key                                        |
| `unit_role_id`     | UUID     | FK to `unit_roles`                                 |
| `task_id`          | UUID     | FK to `tasks`                                      |
| `start_time`       | datetime | Required                                           |
| `end_time`         | datetime | Required for `completed` sessions                  |
| `status`           | enum     | One of `active`, `paused`, `completed`             |
| `duration_seconds` | integer  | Calculated on completion (`end_time - start_time`) |
| `created_at`       | datetime | Auto-generated                                     |
| `updated_at`       | datetime | Auto-updated                                       |
| `deleted_at`       | datetime | For soft-deletion support                          |

#### `units`

| Column             | Type    | Notes                                                            |
| ------------------ | ------- | ---------------------------------------------------------------- |
| `total_tutor_time` | integer | In seconds, auto-updated when tutor times is marked as completed |

### 5.2 Relationships

- `unit_roles (id)` → `tutor_times (unit_role_id)` (many-to-one)
- `tasks (id)` → `tutor_times (task_id)` (many-to-one)
- `unit_roles` → `units`: Each role is tied to a unit, allowing aggregation

### 5.3 Data Integrity Constraints

- No overlapping `active` sessions for a single `unit_role_id`.
- `end_time` must be greater than `start_time`.
- `duration_seconds` must be positive when status is `completed`.

---

## 6. Testing Requirements

### 6.1 Unit Testing

- Unit test all API endpoints.
- Validate correct session state transitions (start → pause → resume → complete).
- Test inactivity timeout logic and session duration calculations.

---
