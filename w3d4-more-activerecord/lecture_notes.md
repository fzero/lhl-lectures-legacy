# More ActiveRecord

First a quick review:

* Basic CRUD
* Associations
    - `has_many`
    - `belongs_to`
* Validations
    - `validates`

### More validations
* Custom validations
    - `validate`
* Validation error messages
    - Adding errors

### Callbacks
* What they are and how do they work
    - Adding behaviour
    - Preventing behaviour
    - Conditional callbacks
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

### Environments
* How to differentiate between development and test databases
