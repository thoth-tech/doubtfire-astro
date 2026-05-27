---
title: OnTrack AI Context Guide
description: Reusable project and repository context for using AI tools with the OnTrack project.
---



**Authors:** Jason Gilfoyle, Yeshin Govender, Leeon Gourav Rangey, Julian Mirchandani, Roeen Kareemy, Anagh Wadhwa

---

## About OnTrack

OnTrack is a learning management system used by universities including Deakin University. It allows students to submit tasks, track their progress, and receive feedback from tutors.

Tutors and staff use the platform to manage units, review submissions, provide feedback, and monitor student performance.

The project is maintained by Thoth Tech, a student-led development team at Deakin University. Development is split across multiple repositories covering frontend, backend, deployment, and documentation.

Main repositories:

- `doubtfire-web` — Angular frontend
- `doubtfire-api` — Ruby on Rails backend
- `doubtfire-astro` — documentation site
- `doubtfire-deploy` — deployment configuration

Current project work includes:

- Migrating AngularJS components to Angular 17
- Improving security
- Updating documentation
- Fixing bugs and improving usability

---

## Current Project Focus

As of T1 2026, the OnTrack team is mainly focused on long-term improvements, security upgrades, and overall modernisation.

### AngularJS to Angular 17 Migration

The largest ongoing project is the gradual migration of the frontend from AngularJS and CoffeeScript to Angular 17 and TypeScript.

The frontend currently contains:

- Legacy AngularJS components
- Modern Angular 17 components

Migration work is being completed incrementally to maintain compatibility and minimise disruption across the shared project architecture.

Contributors should:

- Use Angular 17 for new work
- Avoid creating new AngularJS components where possible
- Follow the existing project architecture
- Maintain compatibility with shared functionality

### Security Improvements

The project is also focused on improving overall security.

Recent improvements include:

- Migrating CI workflows to newer GitHub Actions versions
- Upgrading local development and CI environments to use a newer Node version
- Adding build verification during pull requests
- Improving dependency compatibility

Future security work should aim to:

- Identify and update outdated dependencies
- Modernise legacy tools where appropriate
- Reduce security risks by keeping software versions up to date
- Improve consistency between development environments

### Documentation Improvements

Documentation updates are also a major focus area for the team. Some documents were found to contain outdated or unnecessary information.

Current improvements include:

- Expanding onboarding documentation for new contributors
- Improving local setup instructions
- Improving dev container workflows
- Reducing setup issues for new contributors

---

## Repository Overview

The OnTrack project is split across four main repositories, each responsible for a different part of the system.

- `doubtfire-web` — frontend web application
- `doubtfire-api` — Ruby on Rails backend API
- `doubtfire-astro` — documentation site
- `doubtfire-deploy` — deployment and Docker configuration

Each repository section below follows the same structure:

- Purpose
- Tech Stack
- Important Files and Folders
- Common Contributor Tasks
- AI Should Be Careful About

---

## Frontend Context: `doubtfire-web`

### Purpose

The `doubtfire-web` repository contains the frontend of the OnTrack learning management and feedback system. It is the user-facing part of the platform used by students, tutors, and admins.

The frontend handles student, tutor, and admin interactions, including task submissions, feedback viewing, portfolio management, unit administration, file uploads, PDF previews, calendars, Gantt charts, QR code scanning, discussion prompts, emoji reactions, and comment interactions.

The frontend communicates with the `doubtfire-api` backend through proxy configuration files. The project is currently being migrated from the older AngularJS/CoffeeScript layer to Angular 17 and TypeScript.

### Tech Stack

The frontend uses a hybrid stack because the project is still being migrated.

Modern Angular layer:

- Angular 17
- TypeScript
- Angular Material
- RxJS
- Tailwind CSS
- Angular CLI

Legacy AngularJS layer:

- AngularJS 1.5
- CoffeeScript
- Bootstrap 3
- Grunt

Testing and development tools:

- Karma and Jasmine
- ESLint and Prettier
- Husky and Commitlint

Other important libraries:

- `ngx-entity-service` for structured API entity management
- `@uirouter/angular-hybrid` for routing
- `ng2-pdf-viewer` for PDF rendering
- `html5-qrcode` for QR code scanning
- `@worktile/gantt` for Gantt chart visualisation
- Monaco Editor for in-browser code editing

### Important Files and Folders

Contributors working on the frontend should understand these areas:

- `src/app/` — main application source code
- `src/app/tasks/` — task submissions, comments, and discussion features
- `src/app/projects/` — portfolio and project-related pages
- `src/app/units/` — unit and teaching period management
- `src/app/admin/` — admin-facing pages
- `src/app/errors/` — error and timeout handling
- `src/environments/` — environment configuration
- `src/assets/` — static assets and global styles
- `proxy.conf.json` — local backend API proxy configuration
- `proxy-compose.conf.json` — proxy configuration for Docker/local compose setup
- `angular.json` — Angular workspace and build configuration
- `Gruntfile.js` — legacy AngularJS build/watch configuration
- `package.json` — dependencies and development scripts
- `.eslintrc.json` — linting and formatting rules
- `.husky/` — Git hooks and commit message checks

### Common Contributor Tasks

Frontend contributors commonly work on:

- Migrating AngularJS/CoffeeScript components to Angular 17 and TypeScript
- Updating UI components with Angular Material
- Replacing older Bootstrap 3 markup in migrated areas
- Creating or extending entity services
- Fixing frontend bugs in task, portfolio, unit, or admin pages
- Debugging hybrid routing issues
- Updating proxy configuration for local API calls
- Fixing ESLint and Prettier issues
- Writing or updating Karma/Jasmine unit tests
- Reviewing and resolving frontend pull request feedback
- Updating documentation when frontend conventions change

### AI Should Be Careful About

When using AI for frontend work, contributors should clearly mention whether they are working in the legacy AngularJS layer or the modern Angular layer.

AI should be careful to:

- Check whether the file is part of the legacy AngularJS/CoffeeScript layer or the modern Angular/TypeScript layer before generating code
- Avoid mixing AngularJS and Angular 17 patterns
- Avoid generating new CoffeeScript for new work
- Avoid generating standalone Angular components, because the project currently uses NgModule-based architecture
- Avoid using standard Angular Router assumptions, because the project uses `@uirouter/angular-hybrid`
- Avoid creating raw `HttpClient` calls if an existing `ngx-entity-service` pattern should be used
- Use Angular Material for modern UI work
- Use Tailwind only in modern Angular components
- Avoid suggesting Bootstrap 4 or Bootstrap 5, because the legacy layer uses Bootstrap 3
- Follow RxJS patterns carefully and avoid memory leaks
- Ensure AI-generated code is reviewed, linted, tested, and checked against the existing repository structure
- Follow Conventional Commits format, because Husky and Commitlint enforce commit message rules

---

## Backend Context: `doubtfire-api`

### Purpose

The `doubtfire-api` repository contains the backend for OnTrack. It manages data persistence, business logic, authentication, and communication between the database and frontend interfaces through a RESTful API.

### Tech Stack

- Ruby on Rails
- Ruby 3.1.0
- REST API architecture
- Header-based authentication using user and token headers

### Important Files and Folders

Important backend areas include:

- `doubtfire-api` — main backend repository containing server-side logic
- `/api/auth` — authentication endpoint used for login and token generation
- `/api/submissions` — endpoint area related to student submission retrieval and management
- Backend routes, controllers, and models should be checked before adding or changing API behaviour

### Common Contributor Tasks

Backend contributors commonly work on:

- Updating or creating REST API endpoints
- Supporting frontend feature requirements
- Managing unit, student, task, and submission data
- Reviewing authentication and permission logic
- Testing backend behaviour
- Investigating security-related issues

### AI Should Be Careful About

AI should be careful to:

- Include required authentication headers such as `X-Doubtfire-User` and `X-Doubtfire-Token` in request examples where needed
- Avoid inventing API endpoints without checking the actual routes
- Use correct REST methods: `GET` for reading, `POST` for creating, `PUT` for updating, and `DELETE` for removal
- Treat security-related suggestions as draft advice that must be manually reviewed and tested
- Check backend logic against existing Rails conventions before suggesting changes

---

## Documentation Context: `doubtfire-astro`

### Purpose

The `doubtfire-astro` repository contains the OnTrack documentation site. It is used for contributor guides, onboarding information, project documentation, and support resources for the Thoth Tech team.

### Tech Stack

- Astro
- Starlight
- Markdown
- Node.js and npm
- Netlify deployment

### Important Files and Folders

Documentation contributors should know:

- `src/content/docs/` — main documentation page location
- Each page requires frontmatter fields such as `title` and `description`
- File structure affects page URLs and sidebar navigation
- Documentation pages are written in Markdown format

### Common Contributor Tasks

Documentation contributors commonly work on:

- Creating or updating documentation pages
- Editing onboarding guides
- Updating project information
- Fixing formatting or broken links
- Running the documentation site locally

Common local setup commands:

```bash
npm install
npm run dev
```
---
### AI Should Be Careful About

AI should be careful to:

- Keep Markdown formatting valid and consistent
- Avoid generating incorrect file paths or repository names
- Keep documentation aligned with the existing project structure
- Review generated commands and content before pushing changes
- Avoid adding unsupported formatting that may not work in Astro/Starlight

---

## Deployment Context: `doubtfire-deploy`

### Purpose

The `doubtfire-deploy` repository contains the Docker-based configuration for running the full OnTrack stack locally and in production. It connects the Rails API, Angular frontend, PostgreSQL database, and RabbitMQ message broker.

### Tech Stack

- Docker
- Docker Compose
- Docker Desktop or Docker Engine on Linux
- PostgreSQL
- RabbitMQ
- Rails API service
- Angular frontend service

### Important Files and Folders

Important deployment files include:

- `docker-compose.yml` — defines and orchestrates services in the stack
- `.env.example` — template for required environment variables
- Configuration files used to connect the frontend, backend, database, and message broker

Key services in the compose configuration include:

- `doubtfire-api` — Ruby on Rails backend
- `doubtfire-web` — Angular frontend
- PostgreSQL — primary relational database
- RabbitMQ — message broker used for background job processing

### Common Contributor Tasks

Deployment contributors commonly work on:

- Updating service versions in the compose file
- Configuring environment variables for local development
- Troubleshooting port conflicts between services
- Verifying that API and frontend containers can communicate correctly
- Testing deployment changes before submitting a pull request

### AI Should Be Careful About

AI should be careful to:

- Specify which service or container the issue relates to
- Include the exact error output from `docker compose logs`
- Avoid assuming the compose file structure matches generic Docker tutorials
- Check the actual repository configuration before suggesting changes
- Avoid exposing secrets or private environment values
- Remember that deployment changes can affect all contributors and should be reviewed carefully before merging

- Remember that deployment changes can affect all contributors and should be reviewed carefully before merging

---



## AI Usage Warnings

AI tools such as ChatGPT, Claude, and Cursor can help contributors with debugging, documentation, code explanation, and code generation. However, AI-generated responses are not always accurate and should be reviewed carefully.

The OnTrack project contains a hybrid architecture, so AI may misunderstand where legacy components still exist.

Common AI mistakes may include:

- Assuming the frontend is entirely Angular 17
- Ignoring the presence of AngularJS
- Generating CoffeeScript where TypeScript should be used
- Confusing repository responsibilities
- Inventing file paths, APIs, components, or project rules

AI-generated responses should be:

- Reviewed manually
- Tested locally
- Formatted correctly
- Checked against the existing project structure
- Verified against repository conventions

When using AI, contributors should:

- Specify the repository name
- State whether the issue relates to frontend, backend, deployment, or documentation
- Include relevant code snippets
- Include exact error messages where possible
- Mention whether frontend code is Angular 17 or AngularJS
- Explain expected behaviour and actual behaviour
- Provide relevant file names or folder paths

AI should assist contributor productivity, not replace contributor review. Contributors remain responsible for security validation, architecture decisions, code quality, testing, and final review.

---

## Related Guide

For reusable prompt templates and example prompts, see the separate Example Prompts Guide.

This AI Context Guide focuses on project and repository context. The Example Prompts Guide focuses on how contributors can structure their questions when using AI tools.