# Introduction to DoubtFire-Web 
The DoubtFire-Web frontend application is an easy-to-use online platform designed to help manage different features of the DoubtFire system. Its goal is to make things smoother and improve the experience for both users and administrators. The application covers important areas like managing user accounts, administration tools, connecting with APIs, and includes common features like audio players, audio recorders, and editable content.
This application is built using Angular, a framework that helps create organized and maintainable code, especially for single-page applications. Some key technologies used in this project include:
•	**Angular**: This is the main tool for building and organizing the different parts of the application.
•	**Karma**: This is used for testing the application to make sure everything works as it should.
•	**Nx**: This tool helps manage the project’s structure, making it easier to work with a large codebase.
## Migration Process
Doubtfire web(Frontend) migration from AngularJS/Coffeescript to **Angular/Typescript**, including refactoring all components, is currently in development.
1.	Refactoring all components for modern web standards.
2.	Improving code maintainability and performance.
3.	Streamlining development workflows.
The migration process is ongoing, and several components are being actively developed or refactored to align with the new architecture.
59 components are still in process of migration.

### Opening Frontend code
1.	Open VS Code.
2.	Navigate to the Command Palette by pressing Ctrl + Shift + P (Windows/Linux) or Cmd + Shift + P (Mac).
3.	Select the command:
Dev Containers: Open Folder in Container...
4.	Choose the doubtfire-deploy folder to open it inside the dev container.

![alt text](image-1.png)

**Accessing the doubtfire-web Repository**
After setting up and running the development container, the next step is to navigate to the doubtfire-web repository to check the status of the components. This repository contains the frontend code for the OnTrack system, including all the components that have been fully migrated to TypeScript or are still in the process of migration.

![alt text](image-2.png)

**to Open and Inspect doubtfire-web Components**
1.	Open the doubtfire-web Directory:
o	Navigate to the doubtfire-web folder from within the development container.
2.	View Migrated and Pending Components:
o	Open the project in VS Code and explore the src directory.
o	You will find the following:
	Components that have already been migrated from CoffeeScript to TypeScript.
	Components that are still in CoffeeScript and are in the process of being migrated.
3.	Check Component Status:
o	Each component is stored as a separate file in the src/app/components directory. The migrated components will have a .ts extension, whereas components still in CoffeeScript will have a .coffee extension.
4.	Refer to the Component Documentation:
o	The status of each component is documented, so you can identify whether it has been migrated or is pending.

**Reload the frontend once the backend server is up and running. The correct sign-in page like shown below should appear.**
![alt text](image-3.png)

Login with username **student_1** and password **password** and enter 1 as the Student ID/number and sign-in. The dashboard should appear with the enrolled units.

Creating Branch and Initial Migration
Create a branch in my repository 
git checkout development # make sure you are on develop
git pull --rebase upstream development # sync your local develop with upstream's develop
the next step will be fetching the origin git fetch origin

![alt text](image-4.png)

Then the next step will be 
cd doubtfire-web
git checkout -b migrate/not-found

![alt text](image-5.png)

At last, do git remote -v.
The next steps will be-:
 Create a typescript, scss (if exists), and html file
For the Task Description Card we had the files:
•	not-found.coffee
•	not-found.tpl.html
•	not-found.scss
In the same folder we can start by creating the following files:
•	not-found.component.ts
•	not-found.component.html
•	not-found.component.scss
Notice the naming convention. When migrating a component we use the format name.component.extension. Add the start of the TypeScript using something based on the following:

![alt text](image-6.png)

We can’t see any of these changes yet, but it is a good clean start so let’s commit this before we move on.
git add .
git commit -m "build: create initial files for migration”
git push --set-upstream origin touth/migrate/not-found
Then we should make sure to push this back to GitHub so others can see our progress. As this is a new branch you will need to set the upstram branch, but if you forget the git push will remind you anyway.

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](/image-9.png)

Now we need to finish the initial migration-:
Workflow Summary
Step 1. Set up for new feature branch:
git checkout development                # make sure you are on develop
git pull --rebase upstream development  # sync your local develop with upstream's develop
git fetch thoth
git checkout -b my-new-branch           # create your new feature branch```
Step 2. Make changes, and repeat until you are done:
git add ...
git commit
git push     # make changes, commit, and push to origin```
Step 3. Submit a pull request and if unable to merge:
git pull --ff upstream development # merge upstream's develop in your feature branch
git add ...
git commit           # resolve merge conflicts and commit
git push origin                    # push your merge conflict resolution to origin

Non -Migrated Components 
Visualization Components
1.	alignment-bar-chart.coffee
2.	summary-task-status-scatter.coffee
3.	target-grade-pie-chart.coffee
4.	achievement-custom-bar-chart.coffee
5.	student-engagement-bar-chart.coffee
6.	task-grade-distribution-chart.coffee
7.	student-progress-line-chart.coffee
8.	grade-distribution-pie-chart.coffee
9.	submission-analytics-line-chart.coffee


Task Management Components
1.	task-status-selector.coffee
2.	modals/upload-submission-modal.coffee
3.	modals/task-detail-modal.coffee
4.	modals/task-history-modal.coffee
5.	modals/task-priority-modal.coffee
6.	project-tasks-list.coffee
7.	tasks-summary.coffee
8.	task-comments.coffee
9.	task-edit-form.coffee
10.	task-submissions.coffee
11.	modals/task-extensions-modal.coffee

Configuration and Utility Files
1.	privacy-policy.coffee
2.	routing.coffee
3.	analytics.coffee
4.	date-time-utils.coffee
5.	data-export-utils.coffee
6.	form-validation-utils.coffee
7.	ui-interaction-utils.coffee
8.	session-management-utils.coffee
9.	role-based-access-control-utils.coffee
10.	notification-handler.coffee


Admin and Unit Components
1.	admin.coffee
2.	units.coffee
3.	edit.coffee
4.	modals/create-unit-modal.coffee
5.	modals/edit-unit-modal.coffee
6.	unit-list.coffee
7.	unit-overview.coffee
8.	unit-members.coffee
9.	unit-settings.coffee
10.	unit-teaching-periods.coffee

User Profile and Management Components
1.	user-profile-view.coffee
2.	user-profile-edit.coffee
3.	account-settings.coffee
4.	password-reset.coffee
5.	role-management.coffee
6.	user-notifications.coffee
7.	user-session-management.coffee
8.	activity-log.coffee
9.	modals/update-avatar-modal.coffee

Project and Team Management Components
1.	project-details.coffee
2.	project-overview.coffee
3.	team-list.coffee
4.	team-member-management.coffee
5.	modals/create-project-modal.coffee
6.	modals/edit-project-modal.coffee
7.	project-statistics.coffee
8.	team-progress-overview.coffee
9.	project-milestones.coffee





Assessment and Grading Components
1.	grading-criteria-selector.coffee
2.	grade-review-modal.coffee
3.	grade-submission-form.coffee
4.	rubric-management.coffee
5.	grading-status-view.coffee
6.	student-grade-summary.coffee
7.	modals/grade-comment-modal.coffee
8.	feedback-generation.coffee

Miscellaneous Components
1.	error-page.coffee
2.	welcome-page.coffee
3.	help-and-support.coffee
4.	faq-view.coffee
5.	feedback-form.coffee
6.	dashboard-view.coffee
7.	activity-tracker.coffee
8.	system-updates-modal.coffee

These components are currently implemented in CoffeeScript and are subject to migration to TypeScript during the refactoring process. Documentation for these components will be revised and updated as the migration progresses. Let me know if you’d like further elaboration on any specific category or file!


