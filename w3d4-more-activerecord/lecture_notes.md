# More ActiveRecord

I'll start again by saying the ActiveRecord documentation is extensive and very well written. Here are the links to the subjects we're discussing today:

* Associations: http://guides.rubyonrails.org/association_basics.html
* Validations: http://guides.rubyonrails.org/active_record_validations.html
* Callbacks: http://guides.rubyonrails.org/active_record_callbacks.html


### Quick AR review

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
            * To prevent a behaviour, make sure your `before` method returns `false` or raises an exception.
    - Conditional callbacks
        + `:if`, `:unless`
* When do they run (and when they don't)
    - Full reference: http://guides.rubyonrails.org/active_record_callbacks.html#skipping-callbacks
    - `destroy` vs. `delete`
    - `update_column(s)` vs `update` / `save`
    - Running SQL queries directly
* List of common callbacks (in the order they run)
    - `new` callback
        + `after_initialize`
    - `create` callbacks
        + `before_validation`
        + `after_validation`
        + `before_create`
        + `before_save`
        + `around_create`
        + `around_save`
        + `after_create`
        + `after_save`
        + `after_commit` / `after_rollback`
    - `update` callbacks
        + `before_validation`
        + `after_validation`
        + `before_update`
        + `before_save`
        + `around_update`
        + `around_save`
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
    - Defined in `Rakefile`
    - You can see all available tasks with `rake -T`
* The `db/migrate` folder
    - Contains all migrations, ordered by version number or timestamp
    - File names **must** follow the `version_migration_class_name.rb` format
    - Migration classes **must** match file names
        + `class AddCustomersTable` => `01_add_customers_table.rb`
* Migration classes
    - Always inherit from `ActiveRecord::Migration`
    - Must have a `change` method where all changes are made
    - See the `db/migrate` in the lecture code
* Running migrations
    - `rake db:migrate`
    - `rake db:rollback`


### Environments

* How to differentiate between development and test databases
    - First of all: have different databases
        + `project_development`, `project_test`, `project_production`...
    - How to use different ones?
        + Environment variables
            * Defined on the terminal with `variable=value`
            * Readable from Ruby inside the `ENV` global
            * `APP_ENV=development ruby myscript.rb` => `ENV['APP_ENV']`
        + Look inside `setup.rb` to see how `DB_NAME` is defined.
