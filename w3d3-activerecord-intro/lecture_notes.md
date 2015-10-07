# Intro to ActiveRecord

_ActiveRecord_ is a Ruby gem that implements the _active record_ pattern, providing ways to talk to a database using object oriented programming. It's a very popular gem that's included by default in Ruby on Rails, and it's one of the main reasons for its success.

The documentation on ActiveRecord (the gem) is extensive and excellent. Be sure to check it out: http://guides.rubyonrails.org/active_record_querying.html

## Topics:

* Active Record as an ORM
    - Setting up models
        + `CREATE TABLE things...`
        + `class Thing < ActiveRecord::Base`
* CRUD Operations
    - CREATE
        + `instance = Model.new`
        + `instance#save`
        + `Model.create`
    - READ
        + `Model.find`
        + `Model.find_by`
        + `Model.where`
        + `Model.first` / `Model.last`
        + `find` vs `find_by` vs `where`
    - UPDATE
        + change object + `save`
        + `update`
        + `Model.where(...).update_all(...)`
    - DELETE
        + `destroy`
        + `Model.where(...).destroy_all`
    - Quick note on bangs - `save` vs. `save!`
* Method Chaining
    - `Model.where(...).where.not(...).order(...)...`
* Brief intro to Validations
    - `validates :field, <conditions>`
* Associations
    - `has_many`
    - `belongs_to`
