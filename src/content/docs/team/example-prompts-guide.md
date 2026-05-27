---
title: Example Prompts Guide
description: Reusable prompt templates and examples for using AI tools with the OnTrack project.
---



This guide provides reusable prompt templates and examples for contributors using AI tools such as ChatGPT, Claude, Cursor, or similar tools while working on the OnTrack project.

AI-generated output should always be reviewed, tested, and checked against the actual repository before being used. AI should support contributor work, not replace manual review, testing, or team approval.

---

## Reusable Prompt Template

Use this template when asking an AI tool for help with OnTrack work:

```text
I am working on OnTrack, a learning management and feedback system maintained by Thoth Tech.

The frontend is in the `doubtfire-web` repository and uses Angular 17, TypeScript, Angular Material, RxJS, and a legacy AngularJS/CoffeeScript layer.

The backend is in the `doubtfire-api` repository and uses Ruby on Rails with REST API endpoints.

The documentation site is in the `doubtfire-astro` repository and uses Astro, Starlight, and Markdown.

I am currently working on [your specific task].

Here is the relevant file, code, error message, or context:
[paste details here]

Can you help me [your specific request]?

```


## Backend Prompts

- “I am working on the OnTrack back-end using Ruby on Rails. Can you help me implement a new API endpoint for retrieving submissions filtered by unit id?”
- “In OnTrack’s Rails back-end, how would I secure an endpoint so only authenticated users with a valid token can access it?”

## Frontend Prompts

- “In the OnTrack Angular frontend, how should I structure a service to call the `/api/tasks` endpoint and handle authentication headers?”
- “Can you help me build a component that displays student submissions and updates when new data is fetched from the API?”
- “I am working on the OnTrack frontend repository, `doubtfire-web`. The project is a hybrid frontend that is currently migrating from AngularJS/CoffeeScript to Angular 17 and TypeScript.”
- “Before helping, check whether the relevant file is in the legacy AngularJS layer or the modern Angular layer. New work should use Angular 17, TypeScript, Angular Material, RxJS, and the existing NgModule-based architecture. The project uses `@uirouter/angular-hybrid` for routing and `ngx-entity-service` patterns for API-related work.”
- “Please do not generate standalone Angular components, Angular RouterModule examples, Bootstrap 4/5 code, or raw `HttpClient` calls unless the existing project structure confirms they are needed.”

## Migration Prompts

- “What are best practices for migrating large AngularJS apps, such as OnTrack, to Angular 17 incrementally?”

## Documentation Prompts

- “I am working on the OnTrack documentation site using Astro and Starlight. Can you help me write a Markdown page explaining how to run the project locally?”
- “How should I structure documentation in `src/content/docs/` so it aligns with best practices for Astro and Starlight?”

## Security Prompts

- “OnTrack is focusing on fixing security issues. Can you review this API design and identify potential vulnerabilities related to authentication or data exposure?”
- “What are common security issues in Angular and Rails apps like OnTrack, and how can they be mitigated?”
- “I am working on the OnTrack Ruby on Rails backend. Using the Backend Context format, can you help me write a script that sends a `POST` request to `/api/auth` using the `X-Doubtfire-User` and `X-Doubtfire-Token` headers to test for a SQL injection auth bypass?”

## Deployment Prompts

- “I am working on the OnTrack deployment repo using Docker. Can you help me write a Docker configuration for running both the Rails backend and Angular frontend?”
- “How can I optimise Docker builds for a multi-repo project like OnTrack?”

## Testing Prompts

- “In Angular 17, how do I test a service that calls the OnTrack backend API?”