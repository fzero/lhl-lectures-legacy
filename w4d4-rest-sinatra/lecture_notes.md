# W4D4 - MVC / REST / Sinatra review

## Super quick intro to the Model-View-Controller pattern

* Model: Database, validations and so on. Usually a ORM like ActiveRecord.
* View: Displays data to the user.
* Controller: Receives user requests and prepares the views. The _glue_ between Model and View.

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

## Making PUT/PATCH/DELETE requests from plain HTML forms on Sinatra

As of now there are no browsers that can do PUT/PATCH/DELETE requests directly from HTML forms, but there's a [Sinatra configuration workaround](http://www.sinatrarb.com/configuration.html#methodoverride---enabledisable-the-post-method-hack) that can be used to avoid adding unnecessary Javascript code to your project.

First add the following line to the top of your `actions.rb` file:

```ruby
use Rack::MethodOverride
```

Then add a hidden field named `_method` to your form and put the desired HTTP method in the value:

```html
<input name="_method" type="hidden" value="delete" />
```

## Partials

ERB allows you to reuse bits of `erb` code in different pages so you don't need repeat yourself (keep it DRY!). In the code discussed in class, they're being used for forms (`/tunes/new` and `/tunes/:id/edit`) and also on `index.erb` and `show.erb`. Its simplest form is:

```erb
<%= erb :'_partial_name' %>
```

This will render `_partial_name.erb` at that point in the page (partial file names are usually prefixed with an underscore to differentiate from full templates). You can also pass variables to partials using the `locals` parameter, which makes them even more useful:

```erb
<!-- In the erb file where you include the partial: -->
<%= erb :'_quote', locals: {name: 'John Snow'} %>


<!-- Inside _quote.erb: -->
<h1>You know nothing, <%= name %>.</h1>
```

See the [code discussed in class](https://www.dropbox.com/s/cilbnrs4fed9vpx/w4d4-rest-sinatra.tgz?dl=1) for more examples.

## Cookie persistence

There were questions in class about creating session variables that persist for a given time instead of being zapped every time the browser is closed. The Sinatra docs deal with _cookies_ with specific durations, but I couldn't find anything similar for sessions.

To create a cookie with expiry date you'll need to use `response.set_cookie` with an `expires` parameter containing a timestamp.

The timestamp can be created using `Time.now` (which returns the number of seconds since the [Unix Epoch](https://en.wikipedia.org/wiki/Unix_time)) plus the number of seconds until the cookie expiration date. Here's an example:
```ruby
response.set_cookie('cookie_name',
                    {:value => 'cookie value',
                     :expires => Time.now + (60 * 60 * 24 * 30)})
```

That's 60 seconds (= 1 minute) * 60 minutes (= 1 hour) * 24 hours (= 1 day) * 30 days (~ 1 month).

**Sadly this doesn't work with sessions**, but there are probably some Ruby gems out there that help getting around this limitation.

## Code discussed in class

[Just click right here!](https://www.dropbox.com/s/cilbnrs4fed9vpx/w4d4-rest-sinatra.tgz?dl=1)
