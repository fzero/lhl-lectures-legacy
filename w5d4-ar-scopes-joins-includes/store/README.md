# Lighthouse Labs W5D4 - Advanced `ActiveRecord`

## Lecture Notes

Today we covered a variety of advanced topics related to ActiveRecord. You can find the full documentation on `ActiveRecord` methods in the official (and excellent) Rails docs:

http://guides.rubyonrails.org/active_record_querying.html

Most of the topics covered are exemplified in this repo, particularly in the `Product` model.

### Topics covered

* Refresher on query modifiers
   * `offset` and `limit`
   * `order`
   * `distinct`
   * `group`
   * `group(...).having(...)`
* Scopes
   * named scopes with lambda blocks
      * Lambda blocks are anonymous methods
      * scope chaining
      * default scope
   * `unscope` / `unscoped` / `reorder` -> Remove parts of a scope when needed
* Joins
   * `ActiveRecord` only provides `INNER JOIN`s in the ORM
      * `Client.joins(:orders)` -> all clients with orders
      * `Client.joins(:orders).where(orders: { created_at: time_range })`
   * Other types of joins must be in SQL:
      * `Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')`
* Shortcuts
   * `Model.find_or_create_by`
   * `Model.find_or_initialize_by` (= `Model.find` + `Model.new`)
* Performance optimizers
   * `pluck`
   * `select`
   * Eager loading: `includes`
      * Solves N+1 queries

- Fabio
