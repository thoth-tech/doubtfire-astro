---
title: Requirements Document
---

## 1. Overview

This document outlines the functional and non-functional requirements for implementing the "Tutor Times" and assessment analytics feature in OnTrack. These requirements guide backend development to support real-time tracking of tutor marking activity, replacing delayed CSV-based processing.

---

## 2. Functional Requirements

### 2.1 Tracking Tutor Activity

- System must track when a tutor begins interacting with a unit from a unique IP address.
- A new marking session should start if no activity has been recorded in the past 15 minutes from the same (user, unit, IP).
- each tutor action (e.g. opening inbox, GET, PUT, assessing), a new `session_activity` record must be created.
- If the action is `'assessing'`, the corresponding `marking_session` must update:
  - `duration_minutes` (based on start and latest activity)

### 2.2 API Integration

- Backend API endpoints involved in tutor task interactions must invoke `SessionTracker.record_assessment_activity(...)`.
- system must automatically determine whether to continue an existing session or create a new one based on recent activity.

### 2.3 Data Model Requirements

- The database must support two new tables: `marking_sessions` and `session_activities`.
- Referential integrity must be enforced via foreign keys for users, units, and projects.

### 2.4 Authorization

- Only authenticated tutors can trigger session activity recording.
- Only authorized staff (Unit Chairs, Admins) can access aggregated session data.

---

## 3. Non-Functional Requirements

### 3.1 Performance

- All tracking must be performed in real-time with minimal latency (< 200ms per request).
- Queries on sessions and activities must be performant at scale; appropriate indexing is required.

### 3.2 Security

- Session tracking must only occur from authenticated API requests.
- IP addresses must be stored securely in line with privacy regulations and university policy.

### 3.3 Reliability

- The SessionTracker logic must be idempotent and fault-tolerant to network or DB errors.
- The session lifecycle logic must prevent duplicates or overlaps from the same user/IP/unit combo.

---

## 4. Constraints

- Cannot track activities older than 15 minutes to avoid backdating.
- Must be backwards compatible with frontend interaction models.
- Deprecated CSV parsing logic will be removed post-rollout.

---

## 5. Success Criteria

- Real-time tutor sessions and activities are visible in admin reports.
- No performance degradation is observed in marking workflows.
- Data model changes do not impact unrelated modules.
- Tutor engagement metrics are reliably captured for at least 95% of relevant actions.

---

## 6. Dependencies

- Existing `users`, `units`, `projects`, and `tasks` tables
- User authentication middleware (Devise, JWT, etc.)
- Request context (to capture IP and current_user)

---

## 7. Glossary

- **Marking Session:** A continuous period in which a tutor is actively marking tasks in a unit from a given IP address.
- **Session Activity:** A discrete action (GET, PUT, assessing, etc.) taken by a tutor during a session.
- **THRESHOLD:** A rolling inactivity window (15 minutes) used to define session boundaries.

---
