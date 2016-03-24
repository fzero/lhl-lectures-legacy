# W4D4 - MVC / REST / Sinatra review

## Super quick intro to the Model-View-Controller pattern

* Model: Database, validations and so on. Usually a ORM like ActiveRecord.
* View: Displays data to the user.
* Controller: Receives user requestes and prepares the views. The _glue_ between Model and View.

## REST

It's all about mapping models and CRUD operations over HTTP. A model plus the HTTP mapping is called a _resource_. The HTTP verbs map nicely to CRUD actions, but there's one caveat: you can make PUT/PATCH/DELETE requests with raw HTML at this point in time. You have to use Javascript or alternate routes to work around that.

Also note that you shouldn't have display logic on your POST/PUT/PATCH/DELETE actions. Those endpoints **receive information** - use GET requests to display forms. See mapping below and example code for more information.

* model: Tune
    - CREATE
        + **POST /tunes** -> creates a new tune
    - READ
        + **GET /tunes** -> list all tunes (index)
        + **GET /tunes/:id** -> get tune with id = :id (show)
    - UPDATE
        + **PUT/PATCH /tunes/:id** -> update a tune with id = :id
        + workaround: **POST /tunes/:id/update**
    - DELETE
        + **DELETE /tunes/:id** -> Deletes tune with id = :id
        + workaround: **POST/GET /tunes/:id/delete**
            * POST is recommended, but you can use get if you need a simple link. Make sure to confirm deletion when using GET!
    - Additional routes:
        + **GET /tunes/new** -> display form to add a new tune
        + **GET /tunes/:id/edit** -> display form to edit an existing tune

## Code discussed in class

[Just click right here!](https://www.dropbox.com/s/cilbnrs4fed9vpx/w4d4-rest-sinatra.tgz?dl=1)
