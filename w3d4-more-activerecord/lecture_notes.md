PREP TODO:
- make structure like "students and teachers"

# More ActiveRecord

First a quick review:

* Basic CRUD
* Associations
    - `has_many`
    - `belongs_to`
    - `dependent: destroy`
* Validations
    - `validates`
    - Checking for errors
        + `valid?`
        + `errors[]`


### More validations

* Custom validations
    - `validate` with method
* Validation error messages
    - Adding errors
        + `errors.add(:field_key, "message")`


### Callbacks

* What they are and how do they work
    - Adding behaviour
        + e.g. Sending emails, processing images etc.
    - Preventing behaviour
        + e.g. Don't delete a record if condition
    - Conditional callbacks
        + `:if`, `:unless`
* When do they run (and when they don't)
    - `destroy` vs. `delete`
    - `update_column(s)` vs `update` / `save`
    - Running SQL queries directly
* List of common callbacks (in the order they run)
    - `new` callback
        + `after_initialize`
    - `create` callbacks
        + `before_validation`
        + `after_validation`
        + `before_save`
        + `around_save`
        + `before_create`
        + `around_create`
        + `after_create`
        + `after_save`
        + `after_commit` / `after_rollback`
    - `update` callbacks
        + `before_validation`
        + `after_validation`
        + `before_save`
        + `around_save`
        + `before_update`
        + `around_update`
        + `after_update`
        + `after_save`
        + `after_commit` / `after_rollback`
    - `destroy` callbacks
        + `before_destroy`
        + `around_destroy`
        + `after_destroy`
        + `after_commit` / `after_rollback`


### Migrations

* Rake tasks
* The `db/migrate` folder
* Migration classes
    - Adding a new table for a new model. Let's add post comments!


### Environments

* How to differentiate between development and test databases
