# Intro to ActiveRecord

_ActiveRecord_ is a Ruby gem that implements the _active record_ pattern, providing ways to talk to a database using object oriented programming. It's a very popular gem that's included by default in Ruby on Rails, and it's one of the main reasons for its success.

## Topics:

* Active Record as an ORM
* CRUD Operations
    - CREATE
        + `new`
        + `create`
        + `save`
    - READ
        + `find`
        + `find_by`
        + `where`
        + `find` vs `find_by` vs `where`
    - UPDATE
        + change object + `save`
        + `update`
    - DELETE
        + `destroy`
    - Quick note on bangs - `save` vs. `save!`
* Method Chaining
* `first`/`last`
* Brief intro to Validations
* Associations
