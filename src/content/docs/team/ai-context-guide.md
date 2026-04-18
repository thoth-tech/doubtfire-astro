---
title: OnTrack AI Context File
description: Structured project context for use with AI tools such as GPT and Claude.
---


## Project Summary

OnTrack (formerly Doubtfire) is a student progress tracking and task management system used to manage learning activities, submissions, and tutor feedback.

The system consists of:

- Backend: Doubtfire API (REST API)
- Frontend: Doubtfire Web (Angular-based UI)
- Documentation: Astro + Starlight site

---

## Key Repositories

- doubtfire-api → backend REST API
- doubtfire-web → frontend application
- doubtfire-astro → documentation system

---

## Tech Stack

- Frontend: Angular
- Backend: Ruby on Rails (REST API)
- Documentation: Astro + Starlight
- Version Control: Git + GitHub

---

## Backend API Overview

The backend provides multiple REST APIs including:

- auth → authentication and session management
- students → student data and progress
- tasks → task tracking and similarity checking
- projects → project management
- users → user accounts
- submissions → submission tracking
- units → unit and course structure

All APIs follow REST conventions:

- GET → retrieve data
- POST → create
- PUT → update
- DELETE → remove

### Authentication

APIs require:

- `Username` (header)
- `Auth_Token` (header)

### Example Endpoints

- POST `/api/auth` → login
- GET `/api/students?unit_id=1`
- GET `/api/tasks?unit_id=1`

---

## Frontend Overview

The frontend provides user interfaces for tutors and admins.

### Key Feature: Tutor Times

The "Tutor Times" feature allows:

#### Tutor View
- View marking sessions
- Track time spent on tasks
- View activity logs such as assessing and completed states
- Monitor progress across units

#### Admin Dashboard
- View all tutor sessions
- Filter by tutor, unit, project, or date
- View aggregated marking statistics

---

## Frontend Behaviour

- Real-time session updates
- Activity tracking and logs
- Data visualisation using charts and graphs
- Responsive UI for desktop and mobile

The UI includes:
- dashboards
- filters and sorting
- tables and graphs

---

## Key Features

### Core Features
- student progress tracking
- task and submission management
- unit and tutorial organisation

### Frontend Features
- Tutor Times dashboard for tracking marking sessions
- Admin analytics dashboard with filtering and statistics
- Colour vision accessibility support with multiple display modes

### Backend Features
- REST API for managing students, tasks, projects, and users
- authentication using Username and Auth_Token headers

---

## Development Setup

Run documentation site locally:

```bash
npm install
npm run dev