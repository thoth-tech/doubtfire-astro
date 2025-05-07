---
title: Tutor-Times Frontend Requirements
---

## Project Overview

## Table of Contents

- [1. Introduction](#1-introduction)
  - [1.1 Purpose](#11-purpose)
  - [1.2 Scope](#12-scope)
  - [1.3 Intended Audience](#13-intended-audience)
- [2. Functional Requirements](#2-functional-requirements)
  - [2.1 Tutor Session View](#21-tutor-session-view)
  - [2.2 Admin Analytics Dashboard](#22-admin-analytics-dashboard)
  - [2.3 API Integration](#23-api-integration)
  - [2.4 UI Requirements](#24-ui-requirements)
- [3. Non-Functional Requirements](#3-non-functional-requirements)
  - [3.1 Performance](#31-performance)
  - [3.2 Usability](#32-usability)
  - [3.3 Compatibility](#33-compatibility)
  - [3.4 Security](#34-security)
- [4. User Stories](#4-user-stories)
  - [4.1 User Story 1](#41-user-story-1)
  - [4.2 User Story 2](#42-user-story-2)
- [5. Testing Requirements](#5-testing-requirements)
  - [5.1 Component Testing](#51-component-testing)
  - [5.2 Access Control Testing](#52-access-control-testing)
  - [5.3 API Integration Testing](#53-api-integration-testing)

---

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to outline the frontend requirements for the **"Tutor Times"** feature. This feature will allow tutors and admins to access marking session data, monitor progress, and generate reports via the frontend interface.

### 1.2 Scope

This document covers the functional and non-functional requirements for the frontend design, including interaction with the backend API for data retrieval. It focuses on the tutor session view and admin analytics dashboard.

### 1.3 Intended Audience

This document is intended for frontend developers, designers, and stakeholders responsible for implementing and reviewing the **"Tutor Times"** frontend feature.

---

## 2. Functional Requirements

### 2.1 Tutor Session View
- Display a list of recent marking sessions for the logged-in tutor.
- Show:
  - Session start and end times
  - Duration of each session
  - Associated unit and project

### 2.2 Admin Analytics Dashboard
- Allow admins to:
  - View marking sessions of all tutors
  - Filter sessions by tutor, unit, project, or date range
  - See aggregate marking time statistics

### 2.3 API Integration
- Integrate with existing backend APIs to retrieve session data for tutors and admins.
- API endpoints must be called securely and reliably to fetch marking time records.
- Ensure data is displayed in real-time or as close to real-time as possible.

### 2.4 UI Requirements
- Create a user-friendly, intuitive interface for both the Tutor Session View and Admin Analytics Dashboard.
- Design responsive layouts to ensure functionality on different screen sizes (desktop, tablet, mobile).
- Use charts, tables, and filters to present data clearly.
- Include pagination and sorting features where applicable.

---

## 3. Non-Functional Requirements

### 3.1 Performance
- Pages displaying session data should load within 300ms.
- Ensure smooth interactions and updates even with large datasets.

### 3.2 Usability
- The user interface should be easy to use and visually clear for both tutors and admins.
- Ensure accessibility and user-friendly design for diverse audiences.

### 3.3 Compatibility
- Ensure compatibility with modern web browsers such as Chrome, Firefox, Safari, and Edge.
- Make sure the frontend is fully functional across desktop and mobile browsers.

### 3.4 Security
- Secure the session data with appropriate authentication and authorization mechanisms.
- Implement role-based access control (RBAC) to ensure that only authorized users can view specific data.

---

## 4. User Stories

### 4.1 User Story 1

**As a tutor, I want to view a list of my marking sessions, so I can track the time spent on each task and unit.**

- Tutors should be able to view their marking session details, including start/end times and total duration, for each task and unit.

### 4.2 User Story 2

**As an admin, I want to access data from all tutors’ marking sessions, so I can generate aggregate reports and analyze workload.**

- Admins should be able to view marking sessions for all tutors, filter by unit, task, and time, and view aggregated statistics.

---

## 5. Testing Requirements

### 5.1 Component Testing
- Verify the correct rendering of session data, including the start/end time, duration, and associated unit/project.
- Test interactive elements like filters and pagination for functionality.

### 5.2 Access Control Testing
- Test that tutors can only see their own session data and not access other tutors' data.
- Admins should be able to access data for all tutors, but only if they have the necessary permissions.

### 5.3 API Integration Testing
- Ensure that the frontend correctly fetches and displays data from the backend API.
- Test that the frontend handles potential errors (e.g., server downtime, data loading issues) gracefully.
