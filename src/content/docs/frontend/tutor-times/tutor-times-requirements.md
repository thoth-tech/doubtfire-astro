---
title: Tutor-Times Requirements
---


## Project Overview

## Table of Contents

- [1. Introduction](#1-introduction)
  - [1.1 Purpose](#11-purpose)
  - [1.2 Scope](#12-scope)
  - [1.3 Intended Audience](#13-intended-audience)
- [2. Functional Requirements](#2-functional-requirements)
  - [2.1 Tutor's Marking Progress Page](#21-tutors-marking-progress-page)
  - [2.2 User Interface](#22-user-interface)
  - [2.3 Timer/Stopwatch Feature](#23-timerstopwatch-feature)
  - [2.4 Manual Time Input](#24-manual-time-input)
  - [2.5 Notification System](#25-notification-system)
- [3. Non-Functional Requirements](#3-non-functional-requirements)
  - [3.1 Performance](#31-performance)
  - [3.2 Usability](#32-usability)
  - [3.3 Compatibility](#33-compatibility)
  - [3.4 Security](#34-security)
- [4. User Stories](#4-user-stories)
  - [4.1 User Story 1](#41-user-story-1)
  - [4.2 User Story 2](#42-user-story-2)
  - [4.3 User Story 3](#43-user-story-3)
- [5. Design Mockups](#5-design-mockups)
- [6. Testing Requirements](#6-testing-requirements)
  - [6.1 Unit Testing](#61-unit-testing)
  - [6.2 User Acceptance Testing](#62-user-acceptance-testing)

---

## 1. Introduction

### 1.1 Purpose

The purpose of this document is to outline the requirements for the frontend development of the **"Tutor Times"** feature. This feature will enable tutors to track the time spent on providing feedback to students.

### 1.2 Scope

The scope of this document covers the functional and non-functional requirements for the frontend implementation of the **"Tutor Times"** feature.

### 1.3 Intended Audience

This document is intended for frontend developers and the development team responsible for implementing the **"Tutor Times"** feature.

---

## 2. Functional Requirements

### 2.1 Marking Time Page
A dedicated page displays time data for tutors.
Tutors can view time spent on:
- Each unit they’re assigned to. 
- Each task within those units.

Admins can view all tutors' marking time by task and unit.

### 2.2 User Interface

- Design an intuitive and user-friendly interface for the Tutor's Marking Page.
- Ensure responsive design for various screen sizes and devices.

### 2.3 Timer/Stopwatch Feature
- The timer automatically starts when a tutor begins marking a task.
- The timer pauses if the system detects inactivity for more than 10 minutes.
- Timer automatically resumes once activity is detected again.
- Ensure accuracy in time tracking and seamless integration with the backend.

### 2.4 Inactivity Detection
A tutor is considered "inactive" if:
- There are no mouse movements, keypresses, or scrolling for 10 minutes.


### 2.5 Notification System

- Implement a notification system to alert tutors when they reach specific time milestones (e.g., every 5 minutes or at a configurable threshold).

---

## 3. Non-Functional Requirements

### 3.1 Performance

- Ensure that the Marking Page loads quickly.
- Minimize any performance impact on the overall application.

### 3.2 Usability

- The user interface should be intuitive and easy to use for tutors.
- Ensure that the feature is accessible to all users.

### 3.3 Compatibility

- Ensure compatibility with modern web browsers (e.g., Chrome, Firefox, Safari).
- Verify cross-browser compatibility and address any compatibility issues.

### 3.4 Security

- Implement necessary security measures to protect user data and prevent unauthorized access to marking time records.

---

## 4. User Stories

### 4.1 User Story 1

**As a tutor, I want to view visual reports of how much time I’ve spent on each task and unit.**

- Tutors should be able to view the time spent on each task and unit on the Marking Page.

### 4.2 User Story 2

**As an admin, I want to see how long each tutor has spent providing feedback to each student.**

- Admin should have access to view the total marking time for each tutor on the Tutor's Marking Progress Page.

---

## 5. Design Mockups

- [Wireframes and Mockups](./tutor-times-design)


---

## 6. Testing Requirements

### 6.1 Unit Testing

- Develop unit tests to ensure the correctness and reliability of frontend components, including timers, manual input, and notifications.

### 6.2 User Acceptance Testing

- Conduct user acceptance testing to verify that the **"Tutor Times"** feature meets the requirements and user expectations.
