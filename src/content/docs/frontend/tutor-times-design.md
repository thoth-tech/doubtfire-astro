---
title: Tutor-Times Design
---


## 1. Introduction

### 1.1 Purpose

This document outlines the design of the frontend for the "Tutor Times" feature in OnTrack (formerly known as Doubtfire). The purpose is to provide an intuitive and user-friendly interface for tutors to track and manage the time spent on providing feedback to students.

### 1.2 Scope

The scope of this design document covers the user interface (UI) and user experience (UX) aspects of the "Tutor Times" feature within the OnTrack Learning Management System. This feature will enhance the skill-based course delivery model by enabling tutors to monitor their time management efficiently.

### 1.3 Intended Audience

This document is intended for frontend developers, designers, and stakeholders involved in the
implementation of the "Tutor Times" feature.

## 2. User Interface (UI) Design

### 2.1 Overview

The "Tutor Times" feature will seamlessly integrate into the existing OnTrack UI, maintaining a
cohesive visual identity and navigation structure.

### 2.2 Wireframes and Mockups

#### 2.2.1 Dashboard

- ![Tutor Progress Dashboard](../../../assets/tutor-progress.png)

- The dashboard provides an overview of marking time statistics, including total time spent on a task and time spent per student

#### 2.2.2 Tutor Times Page

- ![Tutor Times Page](../../../assets/tutor-times-page.png)

- The Tutor Times Page displays a list of students and their respective marking times. Tutors can resume, stop, or manually input time for each student.

### 2.3 Responsive Design

The UI will be responsive to ensure a consistent user experience across various devices, including desktops, tablets, and mobile phones.

### 2.4 Colour Scheme

- **Primary Colour**: OnTrack primary colour
- **Secondary Colour**: OnTrack secondary colour
- **Text Colour**: OnTrack text colours

### 2.5 Typography

- **Headings**: OnTrack head text font (Bold)
- **Body Text**: OnTrack body text font (Regular)
- **Buttons**: OnTrack button text (Semi-Bold)

### 2.6 Icons

Standard icons will be used for actions such as starting and stopping timers, along with custom
icons for notifications.

### 2.7 Navigation

The "Tutor Times" feature will be accessible through the main navigation menu within OnTrack. Clear breadcrumbs will guide users through the application.

### 2.8 Forms and Inputs

Input forms will include text fields for manual time input, along with resume and stop buttons for timers. Error handling will include validation and user-friendly error messages.

### 2.9 Notifications

Notifications will be displayed at the top of the dashboard, providing real-time feedback on marking progress and milestones.

### 2.10 User Profiles

Tutors will have access to their profiles to view personal information and settings.

## 3. User Experience (UX) Design

### 3.1 User Flows

#### 3.1.1 Tracking Marking Time

1. Tutors log in to OnTrack.
2. Tutor navigates to the Task Inbox.
3. Timer auto-starts.
4. Timer auto-pauses after 12 mins of inactivity.
5. Tutors can manually resume the timer from tutor-times page.
6. Tutors can view their aggregated stats on the Analytics page.

### 3.2 Accessibility

Accessibility features will be implemented, including alt text for images, keyboard navigation, and screen reader compatibility.

### 3.3 Usability

The UI will prioritize usability, with clear and intuitive interactions, ensuring tutors can
efficiently manage marking times.

### 3.4 User Feedback

A feedback mechanism will be incorporated for users to report issues or suggest improvements,
enhancing the feature over time.

## 4. Interactive Features

### 4.1 Timer/Stopwatch Feature

- Timers automatically start when a tutor begins marking and pause after 12 minutes of inactivity.

- Tutors can manually resume or stop the timer for better control.

- This ensures accuracy while still allowing tutors to override in edge cases..

### 4.2 Manual Time Input

- While the system automatically tracks time spent on tasks, tutors have the option to manually input or adjust time entries.

- This feature serves as a fallback in case of technical issues, offline marking activities, or if tutors prefer to log their time retrospectively.

- Manual time entries are clearly labeled and auditable, maintaining transparency and accountability.



### 4.3 Notification System

- Real-time notifications will alert tutors of milestones and progress, enhancing user engagement.

## 5. Performance Considerations

### 5.1 Page Load Times

Efforts will be made to optimize page load times to ensure a seamless user experience.

### 5.2 Caching

Caching mechanisms will be implemented to reduce load times and improve overall performance.

## 6. Compatibility

### 6.1 Browser Compatibility

- Supported browsers: Chrome, Firefox, Safari, Edge
- Cross-browser compatibility will be ensured.

### 6.2 Device Compatibility

Responsive design will ensure compatibility with various devices, including desktops, tablets, and
mobile phones.

## 7. Security

### 7.1 Data Security

- User data will be securely stored and protected against unauthorized access.

### 7.2 HTTPS

- HTTPS will be enforced to secure data transmission between the frontend and backend.

## 8. Version Control and Collaboration

### 8.1 Version Control

- Git will be used for version control, following a branching strategy for collaborative
  development.

### 8.2 Collaboration Tools

- Tools like MsTeams and project management software will facilitate communication among team members.

## 9. Testing Plan

### 9.1 Unit Testing

- Unit tests will be developed for frontend components, including timers, input forms, and
  notifications.

### 9.2 User Acceptance Testing

- User acceptance testing (UAT) will ensure that the "Tutor Times" feature meets user requirements and expectations.

## 10. Deployment Plan

### 10.1 Deployment Environment

- The feature will be deployed to the OnTrack production environment.

### 10.2 Deployment Process

- A systematic deployment process will be followed to release frontend updates to the live
  environment.

## 11. Conclusion

This design document provides a comprehensive plan for the frontend implementation of the "Tutor Times" feature in OnTrack. It outlines the UI/UX design, interactive features, performance considerations, compatibility, security measures, and testing strategies. This design will enhance the learning experience for tutors and students, promoting efficient time management and feedback delivery.

## 12. Appendices

- Once the UI and UX designs are finalized, links will be provided to the mockups.
- Once the UML diagrams are finalized, links will be provided to the diagrams.
- Once the feature is implemented, a link will be provided to the frontend repository.