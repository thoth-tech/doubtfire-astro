---
title: Unit Group Set Editor Migration Plan
---

## Introduction

This document records the investigation and proposed migration plan for the
`unit-group-set-editor` feature in `doubtfire-web`.

The purpose of this investigation is to understand the parent and child component
relationships before migrating the feature from AngularJS/CoffeeScript to Angular
TypeScript.

## Task Scope

The `unit-group-set-editor` appears to act as a parent component for the unit group
set management workflow.

Based on the ticket reference diagram, the related component structure is:

```text
Unit-Group-Set-Editor
├── File-uploader
└── Group-set-editor
    ├── Group-selector
    └── Group-member-list