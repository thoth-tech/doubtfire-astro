---
title: Colour Vision Accessability Theme Picker
---

## Introduction

This is where tickets for implementation of this feature currently live

### TASK SCOPE #READ ME FIRST

This proposal is to add an accessibility feature to improve the user experience of users with colour deficiency, specifically those with protanopia, dueteranopia, and tritanopia (red/green deficiencies, and red yellow deficiency).

Motivation -

Approximately 1/15 men and 1/200 women have some degree of colour vision deficiency. This is a non-trivial number of current OnTrack users. Providing a theme option that adjusts colours to be optimized for specific colour deficiencies ensures OnTrack is accessible to a wider audience

There are certain web accessibility standards (WCAG 2.1) that this feature would be in compliance with, and demonstrates a commitment to inclusivity.

Proposed implementation

Theme options:

Build themes that can dynamically allocate colours to existing coloured components. Colour pallets should be explicitely defined and compliant with accessibility standard

Default

Deuteranopia

Protanopia

Tritanopia

User interface

As a user I want to navigate to /edit_profile and select from a THEME dropdown menu

1. Default Colours [ sample colours ]

2. Deuteranopia [ sample colours ]

3. Protanopia [ sample colours ]

4. Tritanopia [ sample colours ]

Persistance

Store the users selected theme in user profile settings in the db.

High Level Requirement Analysis

Front End

File Updates

1.modify the /edit_profile page to include UI compoenent for theme selection

2.update doubtfire-web/src/styles global stylesheets to support new themes (consider migrating to ts)

Components

1. create scalable ThemeSelector component for dropdown menu

2. implement dynamic theme switching using ccs variables or ts voodoo magic

Testing

1. write unit testing for ThemeSelector component




Back End

File Updates

1. Update user model to include theme field

2. Modify api endpoints to handle theme changes

DB changes

1. write migration to include

t.bool is_CVD and

t.index ["CVD"] name: "Deuteranope", "Protanope", "Tritanope"

columns in users table

Testing

1. add tests to validate api behavior in user profile

Misc

Documentation

1. Update documentation where appropriate

Timeline (would be nice but unlikely to get to deployment in this semester)

Sprint 1 - Feature approval, design mockup, colour palletes confirmed, implementation scoped and ticketed

Sprint 2 - Implementation of front and backend changes

Sprint 3 - Implementation of front and backend changes

Sprint 4 - Testing and bug fix

### WHAT IS CVD #READ ME SECOND

WHAT IS CVD
Colour Vision Deficiency (CVD) refers to the reduced ability to distinguish between certain colours. Commonly referred to as "colour blindness," CVD rarely means seeing no colour at all—instead, it usually involves difficulty distinguishing specific colours. The most common types are:

Deuteranopia – affects green cone cells (green-red blindness, most common)

Protanopia – affects red cone cells (red-green blindness, pretty rare)

Tritanopia – affects blue cone cells (blue-yellow blindness, very rare)

Globally, around 1 in 12 men and 1 in 200 women experience some form of CVD, making it a significant accessibility consideration in user interface design. For users with CVD, poorly chosen colour schemes can result in key interface elements being indistinguishable or misinterpreted, directly impacting their ability to effectively use an application. This is already affecting users of OnTrack

From a user experience (UX) perspective, this task is about inclusivity—ensuring OnTrack is accessible to a broader range of users. From a technical perspective, it involves designing a system that supports dynamic theme switching, building colour palettes that are perceptually distinct for users with each type of CVD, and ensuring those palettes are applied consistently across the app. It also means persisting these preferences per user and adapting components to use variables or styling strategies that make theme switching seamless and maintainable.

By building these themes, we move toward compliance with WCAG 2.1 accessibility standards, while also enhancing usability and demonstrating that accessibility is a core value of the OnTrack platform. This task is not just about colours—it’s about creating a better experience for everyone.

### PROPOSED COLOUR REPLACEMENTS MASTER LIST

STATUSES - note this is in .scss

DEFAULT - Already implemented

$task-status-color-scheme-default: (
ready-for-feedback: #0079d8,

not-started: #cccccc,

working-on-it: #eb8f06,

need-help: #a48fce,

fix-and-resubmit: #f2d85c,

feedback-exceeded: #d46b54,

redo: #804000,

discuss: #31b0d5,

demonstrate: #428bca,

complete: #5bb75b,

fail: #d93713,

time-exceeded: #d93713,

);



Deuteranopia

Use blues, purples, and yellows.



$task-status-color-scheme-deuteranopia: (

ready-for-feedback: #0079d8,

not-started: #cccccc,

working-on-it: #ffb000,

need-help: #9e79b9,

fix-and-resubmit: #fada5e,

feedback-exceeded: #a34a02,

redo: #5c3c11,

discuss: #2f8bc9,

demonstrate: #4378a0,

complete: #4682b4,

fail: #a60303,

time-exceeded: #a60303,

);



Protanopia

Avoid Reds / Oranges



$task-status-color-scheme-protanopia: (

ready-for-feedback: #0079d8,

not-started: #cccccc,

working-on-it: #f0a500,

need-help: #9270d1,

fix-and-resubmit: #fff16b,

feedback-exceeded: #996600,

redo: #6f4e37,

discuss: #3ca9d0,

demonstrate: #507dbc,

complete: #569f59,

fail: #7a0019,

time-exceeded: #7a0019,

);



Tritanopia

Use reds, pinks, and teals to ensure separation.

$task-status-color-scheme-tritanopia: (

ready-for-feedback: #d36f6f,

not-started: #cccccc,

working-on-it: #d99d00,

need-help: #bc82cc,

fix-and-resubmit: #f5c900,

feedback-exceeded: #9c4b2f,

redo: #7a5230,

discuss: #58a575,

demonstrate: #3e886f,

complete: #4caf50,

fail: #b00020,

time-exceeded: #b00020,

);

---
GRAPH - note this is in .coffeescript

DEFAULT - Already implemented

$burndown-chart-color-scheme-default = {
now: '#CACACA',
projected: '#AAAAAA',
target: '#777777',
done: '#0079d8',
signoff: '#E01B5D'
}


Deuteranopia
$burndown-chart-color-scheme-deuteranopia = {
now: '#bcbcbc',
projected: '#a0a0a0',
target: '#707070',
done: '#0073b9', # vivid blue
signoff: '#aa5585' # purple-ish pink
}

Protanopia

$burndown-chart-color-scheme-protanopia = {
now: '#bcbcbc',
projected: '#a0a0a0',
target: '#707070',
done: '#2282a8', # teal-blue
signoff: '#a05c78' # mauve/purple-red
}

Tritanopia
$burndown-chart-color-scheme-tritanopia = {
now: '#bcbcbc',
projected: '#a0a0a0',
target: '#707070',
done: '#4c9c4c', # green
signoff: '#cc4a60' # muted red/pink
}

### Theme selection integration in profile setting

Integrate a dropdown menu within the /edit_profile page that allows users to select a preferred theme so that

AS A USER
IF I select the dropdown menu
THEN I can select one of four options
AND my selection is bound

Proposed implementation:
Modify existing edit-profile.component.ts and its corresponding template edit-profile.component.html to include the theme selection dropdown
See attached design schematic for wireframe design. Note laughing at the design is not permitted.
Drop down options should include 'Default', 'Deuteranopia', 'Protanopia', 'Tritanopia'
The selected theme should be bound to the user profile model to make sure the selection is captured
Acceptance Criteria
drop down menu is visible in /edit_profile
drop down menu is clickable
drop down menu displays four lines
Default
Deuteranopia
Protanopia
Tritanopia
opening and closing menu successfully interacts with other components on the page (ie dropdown menu items move other elements down)
selecting outside of these options closes the drop box without making change
selecting one of these options binds the option in /edit_profile

### Theme selection state management

Selected theme should be stored in application state to allow selected theme to be applied across the application

Implementation: Need tech review

Acceptance Criteria:
WIP - list all places where colours would be expected to be updated ie burndown graph, colour coded statuses etc

### Dynamic theme CSS

Define separate css files for each theme to encapsulate theme-specific colours

Implementation - REQUIRES TECH REVIEW
consider moving src/styles/* into /styles/themes/
File Structure
src/styles/themes/default/_default-theme.scss

src/styles/themes/dueteranopia/_deuteranopia-theme.scss
src/styles/themes/protanopia/_protanopia-theme.scss
src/styles/themes/tritanopia/_tritanopia-theme.scss

consider moving /src/app/visualisations/* to /src/app/visualisations/themes/

/src/app/visualisations/progress-burndown-chart.coffee can be overwritten with

/src/app/visualisations/progress-burndown-chart_deuteranopia.coffee
/src/app/visualisations/progress-burndown-chart_protanopia.coffee
/src/app/visualisations/progress-burndown-chart_tritanopia.coffee
---

### Dynamic theme CSS 2.0: Integration

Global style integration - Import selected themes SCSS file into the main styles.scss to apply theme globally

### Theme switching service

Develop a service (eg ThemeService) to handle theme switch logic.

Implementation:
Method: The service should dynamically load the apppropriate theme SCSS / COFFEE file based on users theme preference
Injection: This service should be injected into main app component to apply theme on initialization
Acceptance Criteria:
work in progress

### BACKEND: User model update

add field theme_preference to user model to store selected theme

Implementation:
Migration: create and run db migration to add field to user model
Validations: fields should only accept predefined theme values

### BACKEND: API endpoint modification

User profile API endpoints should handle theme_preference field from user model

Implementation:
GET: retrieve users current theme preference
PUT/PATCH: update users theme preference
VALIDATIONS: only valid theme values should be accepted

### BACKEND: Database Migration 

write script for db migration to add theme_preference to user table
e.g. #this is pseudo code. don't really use a string!!! ideally this is an enum#

class AddThemePreferenceToUsers < ActiveRecord::Migration[6.1]
def change
add_column :users, :theme_preference, :string, default: 'default'
add_index :users, :theme_preference
end
end

### OPTIONAL: Integration test

Develop integration test to verify theme selection persists across sessions and is correctly injected on application initialization

### OPTIONAL: Unit test

unit tests for functionality
write test for ThemeService to ensure themes are being correctly applied
write test for edit-profile-form.component to verify options are displayed correctly

### DOC: Dev documentation 

once tech review completed document
structure of theme scss files,
coffee files,
purpose of ThemeService,
style guidelines,
API endpoint information
