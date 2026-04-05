---
title: Backend API's
---

### Backend requirements of CourseFlow within OnTrack:

#### Course:

The routes involved with this will be relatively straightforward.

| Endpoint                         | Description                                        | Request Body                    | Response Body|
| ---------------------------------|----------------------------------------------------|---------------------------------|--------------|
| GET /course                      | Get all course data                                | None                            | Course[]     |
| GET /course/courseId/:courseId   | Get a course by id                                 | None                            | Course       |
| GET /course/search               | Get courses that partially match the search params | None                            | Course[]     |
| POST /course                     | Add a new course.                                  | Course                          | Course       |
| PUT /course/courseId/:courseId   | Updates an existing course via its id              | Course                          | Course       |
| DELETE /course/courseId/:courseId| Deletes an existing course via its id              | None                            | None         |

Technically speaking, a course would likely only have different versions on a per year basis. However, to cater for the possibility that a course of a particular year gets updated, it would be a good idea to keep a history of this. The course map will keep track of a specific entry of a Course which will allow students to load up the correct version of the course (which by extension, will allow loading of the correct course requirements which will also be tied to specific course versions).

The url will link to the course page which will provide more information about the course (that don't need to be present in CourseFlow such as contacts and entry requirements etc.). This can either be presented on the client side as a simple link or used to embed the course page within an IFrame element.

#### Course Map

Upon entry to the CourseFlow system within OnTrack, the course map associated with the authenticated user will need to be fetched or created.

As such, the backend needs to have the following routes to cater for this:

| Endpoint                                  | Description                                       | Request Body   | Response Body|
| ------------------------------------------| --------------------------------------------------| -------------- | -------------|
| GET /coursemap/userId/:userId             | Get a user's course map via their userId          | None           | CourseMap    |
| GET /coursemap/courseId/:courseId         | Get all course maps via the course id.            | None           | CourseMap[]  |
| POST /coursemap                           | Add a new course map for a user.                  | CourseMap      | CourseMap    |
| PUT /coursemap/courseMapId/:courseMapId   | Updates an existing course map via its id.        | CourseMap      | CourseMap    |
| DELETE /coursemap/courseMapId/:courseMapId| Deletes an existing course map via its id.        | None           | None         |
| DELETE /coursemap/userId/:userId          | Deletes all course maps by user ID                | None           | None         |

The options at present involves:

- Getting student enrolment information via an API to Deakin University's systems.
- Importing student enrolment information.
- Manually setting the course via a client side user interface (will be an input box resulting in best matching courses based on search query).
- Associating a course upon creation of the user and have the course map created at this point in time.

#### Course Map Unit:

This has a strong association with the course map and upon entry into the CourseFlow system, once we have the course map associated with the user fetched, we can use the course map id to fetch all course map units that belongs to the specific course map.

| Endpoint                                | Description                                                    | Request Body   | Response Body  |
| ----------------------------------------| ---------------------------------------------------------------| ---------------| ---------------|
| GET /coursemapunit/courseMapId          |Get a all course map units associated with the course map id.   | None           | CourseMapUnit[]|
| POST /coursemapunit                     |Add a new course map unit for a user.                           | CourseMapUnit  | CourseMapUnit  |
| PUT /coursemapunit/courseMapUnitId      |Updates an existing course map unit via its id.                 | CourseMapUnit  | CourseMapUnit  |
| DELETE /coursemapunit/courseMapUnitId   | Deletes an existing course map unit via its id.                | None           | None           |
| DELETE /coursemapunit/courseMapId       | Deletes all course map units via the associated course map id. | None           | None           |

The key factors here are:

- Course map id which will associate a specific course map to the respective course map units.
- Unit id which will associate the course map unit with a unit. This in itself will allow obtaining of unit information
  such as name, unit  code, handbook url and requirements etc.
- All three slot fields and their respective values will allow for matching to the correct spot on the client side visuals.

#### Specialization

We simply need routes that can get/add/update/delete specializations:

| Endpoint                                | Description                                   | Request Body   | Response Body   |
| ----------------------------------------| ----------------------------------------------| ---------------| --------------- |
| GET /specialization                     | Get all specializations                       | None           | Specialization[]|
| GET /specialization/specializationId    | Get specialization by id                      | None           | Specialization  |
| POST /specialization                    | Add a new specialization                      | Specialization | Specialization  |
| PUT /specialization/specializationId    | Updates an existing specialization via its id | Specialization | Specialization  |
| DELETE /specialization/specializationId | Deletes an existing specialization via its id | None           | None            |

The Specialization API provides a set of routes to manage specializations in a system. It allows users to retrieve all specializations (`GET /specialization`) or a specific one by ID (`GET /specialization/specializationId`), add new specializations (`POST /specialization`), update existing ones by ID (`PUT /specialization/specializationId`), and delete specializations by ID (`DELETE /specialization/specializationId`). Each route interacts with specialization data, supporting standard CRUD (Create, Read, Update, Delete) operations.

#### Requirement:

Requirements define specific academic criteria or conditions that must be met within courses or units in the CourseFlow system. They specify what students need to complete, with optional minimum and maximum values, and are organized into requirement set groups. Requirements can be associated with either specific units or entire courses depending on their type.

| Endpoint                            | Description                               | Request Body | Response Body |
| ----------------------------------- | ----------------------------------------- | ------------ | ------------- |
| GET /requirement                    | Get all requirements                      | None         | Requirement[] |
| GET /requirement/unitId/:unitId     | Get requirements filtered by unit ID      | None         | Requirement[] |
| GET /requirement/courseId/:courseId | Get requirements filtered by course ID    | None         | Requirement[] |
| POST /requirement                   | Create a new requirement                  | Requirement  | Requirement   |
| PUT /requirement/:id                | Update an existing requirement via its id | Requirement  | Requirement   |
| DELETE /requirement/:id             | Delete a requirement via its id           | None         | None          |

Requirements form the foundation of the CourseFlow system's academic structure, working in conjunction with RequirementSet to define what students must accomplish. Each requirement includes a type and category classification, detailed description, and links to requirement set groups that specify the units or courses needed to fulfill the requirement.

#### RequirementsSet:

This particular entity works in conjunction with Requirements where this provides a mechanism to list out required units that belong to a requirement. Additionally, this also provides a way to chain requirements to handle requirement choices. The routes will be as follow:

| Endpoint                                   | Description                                   | Request Body | Response Body    |
| -------------------------------------------| ----------------------------------------------|--------------| ---------------- |
| GET /requirementset                        | Get all requirement sets                      | None         | RequirementSet[] |
| POST /requirementset/requirementSetGroupId | Get all requirements set for a given group id | None         | RequirementSet[] |
| POST /requirementset                       | Add a new requirement set                     | Requirement  | RequirementSet   |
| PUT /requirementset/requirementSetId       | Updates an existing requirement set via its id| Requirement  | RequirementSet   |
| DELETE /requirementset/requirementSetId    | Deletes an existing requirement set via its id| None         | None             |

Each instance of this entity will be associated to a requirement and it will be our way of tracking a list of units associated with a requirement or chaining to another requirement to essentially create a group of selectable requirements.

#### Unit Definition

| Endpoint                                  | Description                                                | Request Body     | Response Body  |
| ------------------------------------------|------------------------------------------------------------|------------------|----------------|
| GET /unitDefinition                       | Get all unitDefinitions                                    |None              |UnitDefinition[]|
| GET /unitDefinition/unitDefinitionId      | Get a specific unitDefinition based on the unitDefinitionId|None              |UnitDefinition  |
| GET /unitDefinition/unitDefinitionId/units| Get all units associated with the unitDefinitionId         |None              |Unit[]          |
| GET /unitDefinition/search                | Get unit definitions that match search params              |String (name/code)|UnitDefinition[]|
| POST /unitDefinition                      | Create a new unitDefinition                                |UnitDefinition    |UnitDefinition  |
| POST /unitDefinition/unitDefinitionId     | Create a new unit with a specific unitDefinition           |Unit              |Unit            |
| PUT /unitDefinition/unitDefinitionId      | Updates an existing unitDefinition                         |UnitDefinition    |UnitDefinition  |
| DELETE /unitDefinition/unitDefinitionId   | Delete a unitDefinition                                    |None              |None            |
| PUT /unitDefintion/unitDefinitionId/unitId| Remove a unit from the unitDefinition                      |None              |Unit            |

##### What is going to be missing from this semester’s deliverables for Courseflow and what needs to be worked on into the future?

For this webpage there are a few key features that will need future development. Units in a course have rules that need to be followed, this includes the units’ prerequisites, maximum amount of certain level units, requiring specific subjects to be completed, ect. This will need to be implemented to check the course map is valid and follows said rules.

Along side rules there are suggested unit combinations that should be completed in sequence, like part 1 and 2 of the capstone, or similar units across the degree, so maybe some warning and suggestions to the user in how they organise their course maps.
Proper implementation to track for completed and ongoing units. At the moment this is done manually but should just work automatically in the future.

With this unit definition, we want to be able to create and view various types of analytics. This could be an average mark for a type of unit over a year, number of students participating in specific units, ect. So having this unit definition be able to easily collate all the other offerings of the same unit, underperforming tasks, all sorts of information can be gleaned from this.

Like units, there are different versions of courses, therefore there is space to create a similar course definition object to store the differences between the courses, including different unit groups and such. Should be implemented in basically the same way as the above unit definition.

Want some way to implement a connection to the student services to get the ideal course maps/plans and maybe be able to view them inside of ontrack/courseflow.

Summary:

- Implement the rules for assigning units, prerequisites, ect.
- Implement a course definition to store different versions of the courses
- Be able to view given course maps from student services or something.