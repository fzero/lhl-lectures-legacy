# W4D5 - Advanced Sinatra, JSON and AJAX

Following on yesterday's lecture, we've discussed a few advanced aspects of Sinatra, like the `before`/`after` blocks and _jumped ahead in time to week 6!_ Why? To discuss JSON (**J**ava**S**cript **O**bject **N**otation) and AJAX (**A**synchronous **J**avascript **A**nd **X**ML), of course!

## Sinatra `before` and `after`

These special blocks allow you to run certain actions and methods before or after specified actions. Example:

```ruby
# actions.rb

helpers do
  # Get logged-in user or redirects to login page
  def check_user
    @user = User.find_by(id: session[:user_id])
    redirect '/login' unless @user
  end
end

# This will run before all actions starting with '/tunes', ensuring
# you always have a logged-in user before proceeding
before '/tunes*'
  check_user
end

get '/tunes/:id' do
  # The action will only be rendered if the user is logged in,
  # since '/tunes/1' matches '/tunes*'
end
```

## JSON

JSON is one of a few ways to format data (**not** formatted HTML) to be sent to/from a server. It's basically a way to transform a hashes and arrays into strings and back. All you need to do in Ruby is require the `json` gem. Javascript supports JSON directly. You can use `JSON.stringify()` (object to JSON) and `JSON.parse()` (JSON to object) in both languages the same way. In ruby you also get `.to_json` methods on all main data types (numbers, strings, arrays, hashes and so on).

```ruby

require 'json'
myhash = {:chocolate => 'Lindt', :coffee => 'Espresso'}
jsondata = myhash.to_json
# => "{\"chocolate\":\"Lindt\",\"coffee\":\"Espresso\"}"

newhash = JSON.parse(jsondata)
#=> {"chocolate"=>"Lindt", "coffee"=>"Espresso"}
```

**Note that all keys get converted to strings!** That's because JSON is a string representation of the object.

**Supercool bonus stuff:** ActiveRecord knows how to generate JSON data directly from the model, so you can totally do this in your actions:
```ruby
@tune = Tune.first
@tune.to_json
#=> => "{\"id\":1,\"title\":\"A Darkling Plain\",\"artist\":\"Enormous Steel Table\",\"url\":\"http://example.com/enormous_steel_table_a_darkling_plain\",\"comments\":\"Yr lumbersexual meh pbr\\u0026b small batch. Sustainable chambray helvetica pabst distillery. Wes anderson 90's pork belly cliche cornhole neutra.\"}"
```

You can tweak the JSON output by overwriting the `as_json` method inside the model. See `models/tune.rb` for more details.

Here's how to do it in Javascript:
```js
var myobj = {chocolate: 'Lindt', coffee: 'Espresso'};
var jsondata = JSON.stringify(myobj);
//=>  "{"chocolate":"Lindt","coffee":"Espresso"}"

var newobj = JSON.parse(jsondata);
//=> Object {chocolate: 'Lindt', coffee: 'Espresso'}
```

Since both Ruby and Javascript understand JSON, it's very easy to write an application where all views are rendered in the browser using JSON data sent from the server. Enter...

## AJAX

We had a bit of fun using [jQuery](http://jquery.com) to make a few AJAX requests and render the resulting data on the browser. The example code has plenty of comments - be sure to check `actions.rb` and `views/tunes/index_js.erb`.

It's possible to diferentiate requests made from Javascript on Sinatra by using `request.xhr?`, so you don't need to write a separate methods to send HTML or JSON to the browser:

```ruby
get '/tunes' do
  # request.xhr? returns true when the request comes from Javascript...
  if request.xhr?
    # ...and in that case we return JSON
    @user.tunes.to_json
  else
    # If it's regular request, proceed as usual and render HTML
    erb :'tunes/index'
  end
end
```

Be sure to check the jQuery documentation for the main AJAX methods:

* [`$.ajax()`](http://api.jquery.com/jQuery.ajax/) - The main AJAX method
* [`$.get()`](http://api.jquery.com/jQuery.get/) - Shorthand for get
* [`$.post()`](http://api.jquery.com/jQuery.post/) - Shorthand for post

Quick example:
```js
// GET data from `/tunes`
$.get('/tunes', function(data){
  console.log(data);
}, 'json');

// POST data to `/jsontest`
var mydata = {name: 'Fabio', city: 'Toronto'};
$.post('/jsontest', mydata, function(result){
  console.log(result);
}, 'json');
```
