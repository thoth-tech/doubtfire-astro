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

The purpose of this document is to outline the requirements for the frontend development of the **"Tutor Times"** feature. This feature will enable tutors to track and manage the time spent on providing feedback to students.

### 1.2 Scope

The scope of this document covers the functional and non-functional requirements for the frontend implementation of the **"Tutor Times"** feature.

### 1.3 Intended Audience

This document is intended for frontend developers and the development team responsible for implementing the **"Tutor Times"** feature.

---

## 2. Functional Requirements

### 2.1 Tutor's Marking Progress Page

- Create a dedicated page/dashboard where tutors can view their marking progress.
- Display the time spent providing feedback to each student.

### 2.2 User Interface

- Design an intuitive and user-friendly interface for the Tutor's Marking Progress Page.
- Ensure responsive design for various screen sizes and devices.
- Provide an option for tutors to manually input marking time.

### 2.3 Timer/Stopwatch Feature

- Implement a timer feature that **automatically starts** when a tutor opens a student's feedback form and **stops** when they navigate away or close it.
- Tutors should also have the option to **manually control** the timer if needed.
- Ensure accuracy in time tracking and seamless integration with the backend.

### 2.4 Manual Time Input

- Allow tutors to manually input marking time for each student in case they forget to start or stop the timer.

### 2.5 Notification System

- Implement a notification system to alert tutors when they reach specific time milestones (e.g., every 5 minutes or at a configurable threshold).

---

## 3. Non-Functional Requirements

### 3.1 Performance

- Ensure that the Tutor's Marking Progress Page loads quickly.
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

**As a tutor, I want to see how long I have spent providing feedback to each student.**

- Tutors should be able to view the time spent on each student's feedback on the Tutor's Marking Progress Page.

### 4.2 User Story 2

**As a unit chair, I want to see how long each tutor has spent providing feedback to each student.**

- Unit chairs should have access to view the total marking time for each tutor on the Tutor's Marking Progress Page.

### 4.3 User Story 3

**As a unit chair, I want to see how long each tutor has spent providing feedback to each task.**

- Unit chairs should be able to see the time spent by each tutor on specific tasks on the Tutor's Marking Progress Page.

---

## 5. Design Mockups

- ![Tutor Times Page](../../../assets/tutor-times-page.png)
- ![Tutor Progress Dashboard](../../../assets/tutor-progress.png)


---

## 6. Testing Requirements

### 6.1 Unit Testing

- Develop unit tests to ensure the correctness and reliability of frontend components, including timers, manual input, and notifications.

### 6.2 User Acceptance Testing

- Conduct user acceptance testing to verify that the **"Tutor Times"** feature meets the requirements and user expectations.
