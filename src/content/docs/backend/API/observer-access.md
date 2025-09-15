---
title: "Observer Access Control"
description: "Documentation of the observer role and its enforced read-only access policy in the Doubtfire API."
---

## Introduction

### Overview

The Observer Role is a new property added to unit-level roles (`unit_roles` table) in the Doubtfire API. It enables read-only access for tutors or convenors who are granted observer-level privileges. Observers can view information but cannot perform any actions that modify data.


### Changes made
The following changes have been made under this role:


- Added `observer:boolean` column to the `unit_roles` table via migration `(20250803223033_add_observer_to_unit_roles.rb)`.
- Updated `app/helpers/authorisation_helpers.rb` to enforce read-only access when `observer` is true.
- Updated `db/schema.rb` to reflect the migration changes.
- Created unit tests in `test/helpers/authorisation_helpers_test.rb` to validate observer behavior.

### Target audience
This functionality supports:

- External reviewers
- Visiting staff
- Auditors
- Passive monitoring of unit performance
---


## Implementation Details

### New column for Observer
 A new column `observer:boolean` was added to the `unit_roles` table via a database migration. By default, this field is set to `false`.

Following is the code segment for the newly added column: 

```ruby
class AddObserverToUnitRoles < ActiveRecord::Migration[7.1]
  def change
    add_column :unit_roles, :observer, :boolean, default: false
  end
end
```
### Updated code logic for new role
In the previously existing file `authorisation_helpers.rb` under `app/helpers/`  , we have added a new part that will help in adding logic to the observer role. It will limit the observers access control only to read. They will not be able to make any unnecessary changes.

- Code logic added in `authorisation_helpers.rb`:

```ruby
if role_obj.respond_to?(:observer) && role_obj.observer && action != :get
  return false
end
```
Following the code logic that has been implemented, the observer will be allowed only the listed access behavior: 

| Action Type | Allowed if `observer: true` |
|-------------|------------------------------|
| GET         | Yes (Read-only access)       |
| POST        | No                           |
| PUT/PATCH   | No                           |
| DELETE      | No                           |


### Updated database
Since a new column has been added to the table of unit_roles, the  `schema.rb`  file was also updated.
-  All the `charset`  have been updated to a different alias of `utf8`, which is `utf8mb3`. 
-  The `collation` has also been updated to  ` utf8mb3_unicode_ci`.  

Following is the changes made to the `unit-roles` table, along with the general changes of the schema:

```ruby
create_table "unit_roles", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|  # charset and collation have been updated
    t.bigint "user_id"
    t.bigint "tutorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "unit_id" 
    t.boolean "observer", default: false     # newly added column
    t.index ["role_id"], name: "index_unit_roles_on_role_id"
    t.index ["tutorial_id"], name: "index_unit_roles_on_tutorial_id"
    t.index ["unit_id"], name: "index_unit_roles_on_unit_id"
    t.index ["user_id"], name: "index_unit_roles_on_user_id"
  end
```

### Creating new unit test 

Two tests have been added under`helpers` in the file `authorisation_helpers_test.rb` . In the two unit tests, one will verify that that observer cannot perform non-GET actions and the other will verify observer can perform `:get` actions. 

- Observer cannot perform actions other than `:get`
 
 In this unit test, we create a user with a role (such as a tutor) where the value of observer is `true`. This new role will be added in the `unit_role` table. If the user tries any action other than  `:get`(for example, we used the action `:post`) , their attempts will be rejected. Following is the test logic for this unit test: 

```ruby
result = AuthorisationHelpers.authorise?(user, unit, :post)
assert_equal false, result
```

-	Observer can perform `:get` actions

	In this unit test, we create a user with a role (such as a tutor) where the value of observer is `true`. This new role will be added in the `unit_role` table. This test will check if the newly created user with observer role is performing the GET. If it does, it will get the authority to get the read only access. Following is the test logic for this unit test: 

```ruby
result = AuthorisationHelpers.authorise?(user, unit, :get)
assert_equal true, result

```

---



## Conclusion

The Observer Role provides a secure and clear method for granting read-only access to specific users without compromising data integrity. It prevents user with observer role from making any write actions.  It has been implemented with permission enforcement and validated through unit tests that check the logic set for observer role.