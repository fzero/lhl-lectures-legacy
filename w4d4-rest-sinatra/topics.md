# Topics!

* Super quick intro to the Model-View-Controller pattern
    - Model: Database, validations and so on. Usually a ORM like ActiveRecord.
    - View: Displays data to the user.
    - Controller: Receives user requestes and prepares the views. The _glue_ between Model and View.
* REST
    - model: Tune
        + CREATE
            * POST /tunes -> creates a new tune
        + READ
            * GET /tunes -> list all tunes (index)
            * GET /tunes/:id -> get tune with id = :id (show)
        + UPDATE
            * PUT/PATCH /tunes/:id -> update a tune with id = :id
            * workaround: POST /tunes/:id/update
        + DELETE
            * DELETE /tunes/:id -> Deletes tune with id = :id
            * workaround: POST /tunes/:id/delete
        + Additional routes:
            * GET /tunes/new -> form to add a new tune
            * GET /tunes/:id/edit -> form to edit an existing tune
