---
title: Use Cases for Courseflow
---

### Use Case 1: Visualizing Course Map

##### Title: Student Visualizing Course Map

###### Actors:

- Student
- CourseFlow System

###### Description:

A student wants to visualize their course progression and plan the units they need to complete to graduate. The CourseFlow system displays a personalized course map that outlines completed, ongoing, and pending units. It also highlights prerequisites and required core units.

###### Preconditions:

- The student is enrolled in a course.
- CourseFlow has access to up-to-date academic records.

###### Postconditions:

- The student can see a visual layout of their course map.
- The student can plan upcoming study periods effectively.

###### Main Flow:

- The student logs into CourseFlow.
- The system retrieves and displays the student’s course map.
- The student reviews their planned, completed, and upcoming units.
- The system highlights any prerequisites or required units for future terms.

### Use Case 2: Managing Study Periods

##### Title: Adding and Removing Study Periods

###### Actors:

- Student
- CourseFlow System

###### Description:

A student wants to modify their study plan by adding or removing study periods (such as semesters or trimesters) to better organize their academic timeline. The CourseFlow system allows the student to drag and drop units into different periods and adjust their timeline.

###### Preconditions:

- The student is logged into the CourseFlow system.
- The system contains the required units and course structure for the student’s degree.

###### Postconditions:

- The study periods are updated, and the course map reflects the changes.
- The student’s timeline is adjusted accordingly.

###### Main Flow:

- The student selects the option to modify their course map.
- The system displays available study periods and unit lists.
- The student adds or removes a study period.
- Units are automatically adjusted, or the student can manually drag and drop units.
- The course map updates to reflect the changes.

### Use Case 3: Adding Elective Units

##### Title: Adding Elective Units to Course Map

###### Actors:

- Student
- CourseFlow System

###### Description:

A student wants to explore and add elective units to their course map. The system provides a search bar for the student to find electives based on unit code, interest, or skill, and adds selected electives to the course map.

###### Preconditions:

- The student has electives available in their degree structure.
- The system has a database of elective units.

###### Postconditions:

- The elective units are added to the course map.

###### Main Flow:

- The student navigates to the elective units section.
- The system displays a search bar for the student to look up electives by unit code or category.
- The student selects an elective and adds it to the course map.
- The system updates the course map to include the new elective unit.

### Use Case 4: Marking Units as Complete

##### Title: Marking Units as Complete

###### Actors:

- Student
- CourseFlow System

###### Description:

Once a student has completed a unit, they want to mark it as finished within their course map. This prevents any further changes to that unit and allows the student to track their progress toward graduation.

###### Preconditions:

- The student has completed the unit.
- The system allows units to be marked as complete.

###### Postconditions:

- The unit is marked as complete, and the student’s course map is updated to reflect progress.

###### Main Flow:

- The student selects the completed unit from their course map.
- The system provides an option to mark the unit as complete.
- The student confirms the action.
- The system marks the unit as complete and prevents any further edits or movement of the unit.

### Use Case 5: Tracking Skills and Analytics

##### Title: Tracking Acquired Skills and Progress

###### Actors:

- Student
- CourseFlow System

###### Description:

A student wants to track the skills they’ve acquired throughout their academic journey. CourseFlow summarizes the skills learned from completed units and provides analytics on the student’s progress toward meeting degree requirements.

###### Preconditions:

- The student has completed units that contribute to skill acquisition.
- The system has a record of the skills associated with each unit.

###### Postconditions:

- The student can view a summary of skills learned and monitor their progress toward degree completion.

###### Main Flow:

- The student logs into CourseFlow and navigates to the skills tracker.
- The system summarizes skills learned from completed units.
- The student views the skills summary and progress analytics.
- The system updates the student’s progress and identifies any remaining degree requirements.

### Use Case 6: Creating a Timetable for Study Periods

##### Title: Generating Study Period Timetable

###### Actors:

- Student
- CourseFlow System

###### Description:

A student wants to generate a timetable for their current study period using session information (lectures, tutorials, labs) from their enrolled units. CourseFlow pulls this data and creates a timetable for the student to use.

###### Preconditions:

- The student is enrolled in units for the current study period.
- The system has session data (lecture times, tutorial sessions) for the units.

###### Postconditions:

- A timetable is generated and displayed for the student’s study period.

###### Main Flow:

- The student selects the option to generate a timetable for their study period.
- The system retrieves session information for the student’s enrolled units.
- A timetable is created and displayed, showing the student’s weekly schedule.
- The student can save or print the timetable for future reference.
