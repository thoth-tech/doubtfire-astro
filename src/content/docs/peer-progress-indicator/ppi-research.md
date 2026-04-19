---
title: Peer Progress Indicator Research
---

## Team Member Names

  **Name:** David Nganga\
  **Section worked on:** Existing Systems & Features

  **Name:** Faith Wandabwa\
  **Section worked on:** Existing Systems & Features

  **Name:** Mudith Makawitage\
  **Section worked on:** Functional & non-functional requirements

  **Name:** Sanjana Bottu\
  **Section worked on:** Brainstorm & draft initial user stories


## 1. Research: Existing Systems & Features

### 1.1. Overview

  This report examines Learning Management Systems (LMS), student facing
  analytics dashboards, and project management platforms to identify
  progress tracking features, privacy models, and design patterns suitable
  for the OnTrack Peer Indicator System.

  Currently, OnTrack provides:

  - Individual task and portfolio progress

  - Tutor feedback

  However, it lacks peer visibility features. The following systems were
  reviewed:

  - Canvas

  - Moodle

  - My Learning Analytics (MyLA)

  - GitHub

### 1.2. Systems and Features Reviewed

#### 1.2.1. Canvas LMS

  - Displays progress via status labels: Complete, In Progress, Locked

  - Instructor-only analytics dashboard

  - No peer visibility

  Key Ideas for OnTrack

  - Status labels can map directly to OnTrack tasks

  - Aggregate cohort data can be anonymised for students

  Reference: <https://community.instructure.com/en/kb/articles/660912>

#### 1.2.2. Moodle

  - Uses progress bars and circular indicators

  - Students see only their own progress

  - Teachers access detailed reports

  Key Ideas for OnTrack

  - Familiar progress bar UI

  - Reinforces need for built-in privacy (not retrofitted)

  Reference: <https://docs.moodle.org/en/Tracking_progress>

####  1.2.3. My Learning Analytics (MyLA)

  - Privacy-first student analytics dashboard

  - Uses anonymised performance bands (e.g., 90--100%)

  - Visualisations include:

    - Timeline activity

    - Grade distributions

    - Content popularity

  Key Ideas for OnTrack

  - Performance bands (On Track / Behind / Ahead)

  - Anonymised cohort percentages

  - Opt-in sharing + tutor controls

  Reference:
  <https://sites.google.com/umich.edu/my-learning-analytics-help/home/about-myla>

####  1.2.4. GitHub

  - Activity-based visibility (not grades)

  - Contribution heatmap

  - Public/private control

  Key Ideas for OnTrack

  - Activity heatmap (engagement only)

  - Opt-in visibility model

  Reference: <https://github.com>

### 1.3. Privacy Controls


All reviewed systems share a privacy-first philosophy. The table below
maps key principles observed across systems to their application in our
design. 

|Privacy Principle | Observed In| Application to Peer Indicator System |
|-----------------|-----------|-----------------------------------------|
|Default opt-out / private | Canvas, Moodle, MyLA | All peer visibility is off by default. Students must explicitly opt in.|
| Anonymised aggregates only | MyLA, Canvas (instructor view) | Group-level statistics shown (e.g., '72% of your tutorial completed Task 3'). No individual names or scores exposed.|
| Performance band grouping | MyLA | Students grouped into broad bands (On Track / Slightly Behind / Ahead) to reduce direct comparison.|
| Tutor enable / disable | MyLA, Moodle plugins | Tutors can turn the peer panel on or off per unit. Students cannot override this.|
| Minimal data exposure | All systems reviewed | Only task status is shared no marks, feedback content, or submission scores.|
| Right to withdraw | MyLA | Students can opt out at any time with immediate effect and no residual data retained in peer views. |


### 1.4. Key Insights

  What Works Well

  - Anonymised Cohort Comparisons: Aggregate group-level data (e.g.,
    \'your tutorial is 72% complete on average\') motivates students and
    supports self-regulated learning without triggering direct
    competition. This is the most well-supported finding across the
    literature. (MyLA, General LADs)

  - Visual, Glanceable Indicators: Progress bars, colour-coded status
    icons, and activity heatmaps allow students to absorb progress
    information instantly. Text-heavy reports are consistently less
    effective for motivation. (Canvas, Moodle, GitHub)

  - Seamless Dashboard Integration: MyLA succeeds because it embeds within
    the existing student dashboard rather than requiring navigation to a
    separate system. Our peer indicator should live within OnTrack\'s
    existing student view.

  - Tutor Oversight: Allowing tutors to enable or disable the peer panel
    per unit prevents inappropriate use and gives staff control over
    social dynamics in their cohort.

  - Status Labels Over Scores: Simple labels (In Progress / Needs Help /
    Complete) carry enough information for peer support without exposing
    grades. OnTrack already has these statuses, making implementation
    straightforward.

  Potential Risks

  - Social Comparison Anxiety: Visible peer data can increase anxiety in
    students who see themselves as behind. Risk is highest when individual
    names are shown. Mitigation: anonymised aggregates by default; named
    data only with mutual opt-in.

  - Gaming the System: Students may mark tasks complete prematurely if
    progress is visible. Mitigation: maintain OnTrack\'s existing model
    where only tutors can confirm final task completion.

  - Privacy Legislation: Sharing student records without explicit,
    revocable consent may breach the Australian Privacy Act and Deakin
    University\'s data governance policies. Mitigation: opt-in model with
    clear consent and right to withdraw.

  - Leaderboard Backlash: Research consistently shows that ranking or
    ordering students is negatively perceived. Avoid any ranking; use only
    bands or aggregates.

  ### 1.5. Recommended Features for OnTrack

| Priority    | Feature                   | Description                                                                                                                       | Inspired By     |
| ----------- | ------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| Quick Win   | Cohort Progress Bar       | Anonymised bar showing percentage of the class that has completed each task. No names, low privacy risk, high motivational value. | MyLA, Canvas    |
| Core        | Tutorial Group Peer Panel | Opt-in sidebar showing task status of peers in the same tutorial group. Visible only when both parties have opted in.             | MyLA, GitHub    |
| Enhancement | Performance Band Summary  | Students grouped into On Track / Slightly Behind / Ahead rather than raw percentages to reduce comparison anxiety.                | MyLA            |
| Enhancement | Activity Heatmap          | Weekly activity chart showing days a student engaged with tasks. Opt-in only; no grade or score data.                             | GitHub          |
| Future      | 'Who Needs Help' Signal   | Aggregated count of students who flagged a task as 'Need Help', enabling peer or tutor support without naming individuals.        | Moodle, OnTrack |


### 1.6. Comparison Summary

 | System             | Category           | Peer Visibility     | Privacy Controls        | Key OnTrack Fit                           |
| ------------------ | ------------------ | ------------------- | ----------------------- | ----------------------------------------- |
| OnTrack (current)  | Academic LMS       | None                | Tutor-only              | Baseline add peer layer on top            |
| Canvas             | Academic LMS       | None (students)     | Instructor-only         | Status label model                        |
| Moodle             | Academic LMS       | Nonnative           | Instructor-only         | Progress bar UI pattern                   |
| MyLA (U. Michigan) | Student Analytics  | Yes anonymised      | Consent-based, opt-in   | Strongest privacy model performance bands |
| GitHub             | Project Management | Full (public repos) | Public / private toggle | Opt-in activity heatmap                   |


## 2. User Stories

Format: *As a \[user\], I want \[goal\] so that \[reason\]*

**User Story 1**:

As a student, I want to view the anonymised average progress of my
tutorial group so that I can benchmark my own performance without seeing
individual names.

**User Story 2**:

As a student, I want to see peers grouped into performance bands (On
Track / Slightly Behind / Ahead) so that I can understand where I stand
relative to the group.

**User Story 3**:

As a student, I want to opt-in (or opt-out at any time) to share my
task-status data with my tutorial group so that I control my own
privacy.

**User Story 4**:

As a tutor, I want to see an aggregated count of students who have
flagged a specific task as difficult so that I can prioritise which
tasks to address in my next tutorial session without singling out any
individual student.

**User Story 5**:

As a tutor, I want to enable or disable the Peer Indicator panel for my
entire unit so that I maintain oversight of social dynamics.

**User Story 6**:

As a tutor, I want to send a targeted in-app nudge to all students who
have not yet started a task by a set date so that I can prompt action
without revealing which specific students are behind. 

## 3. Functional Requirements

What the system must do.

| ID  | Requirement                      | Description                                                                                                                                                                                      |
| --- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| FR1 | View Peer Progress               | The system must allow students to view the progress of peers enrolled in the same unit or tutorial group using task completion data (e.g., percentage, completed tasks, or progress indicators). |
| FR2 | Privacy Control (Opt-in/Opt-out) | The system must allow students to opt in or opt out of sharing their progress. Only students who opt in will have their progress included in peer views.                                         |
| FR3 | Anonymised Display               | The system must display peer progress in an anonymised way (e.g., "Student A", averages, or ranges) unless explicit consent and policy allow identification.                                     |
| FR4 | Tutor Configuration              | The system must allow tutors or unit staff to enable or disable the peer progress feature at unit or task level, ensuring appropriate use.                                                       |


## 4. Non-Functional Requirements

System quality requirements.

| ID   | Category           | Requirement                                                                                                                                                                                    |
| ---- | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| NFR1 | Performance        | The system should display peer progress data quickly (within a few seconds) and support near real-time or cached updates without noticeable delay to users.                                    |
| NFR2 | Security / Privacy | The system must protect student data by using existing OnTrack authentication and role-based access control. It must not expose identifiable progress data without user consent.               |
| NFR3 | Accessibility      | The system must comply with accessibility standards (e.g., WCAG), ensuring the interface is readable, usable with keyboard navigation, and does not rely only on colour to convey information. |
| NFR4 | Scalability        | The system should support large numbers of students across multiple units without performance degradation and should scale as more users adopt the feature.                                    |

## 5. Constraints (OnTrack Integration)

- Must integrate with the existing task/portfolio model and task
  statuses.

- Must use current authentication system and user roles (student,
  tutor).

- Must respect the current Angular 17 migration state (components added
  to migrated views only).

- No new backend tables required -- reuse existing task-completion and
  tutorial-group data.

## 6. References


1. Canvas Module Progress Guide:
    <https://community.instructure.com/en/kb/articles/660912>

2. Moodle Tracking Progress Documentation:
    <https://docs.moodle.org/en/Tracking_progress>

3. MyLA Dashboard Overview (University of Michigan):
     <https://sites.google.com/umich.edu/my-learning-analytics-help/home/about-myla>

4. Peer-Comparison Dashboards Research (ScienceDirect):
    <https://www.sciencedirect.com/org/science/article/pii/S2050700319001141>

5. Learning Analytics Dashboards Review (PMC):
    <https://pmc.ncbi.nlm.nih.gov/articles/PMC8853217/>

6. GitHub: <https://github.com>
