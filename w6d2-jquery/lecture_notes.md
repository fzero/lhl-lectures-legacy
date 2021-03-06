# Intro to jQuery

When in doubt, read the docs: http://jquery.com
But search with Google; their internal search sucks.

## Homework + general notes
* https://gist.github.com/donburks/eea8880699a32680dde8

## Selection
* First of all: if all you need is selection, you don't really need jQuery.
    - The library you want is called Sizzle - http://sizzlejs.com
    - Yes, that's used by jQuery internally
    - But guess what, you don't need it unless you're running a jurassic browser; modern versions have the functions `document.querySelector()` and `document.querySelectorAll()` that use pretty much the same syntax as jQuery. More details:
        + https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector
        + https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelectorAll
        + Code snippets: https://developer.mozilla.org/en-US/Add-ons/Code_snippets/QuerySelector
* Getting elements the oldschool way:
    - By id
        + vanilla: `document.getElementById('id')`
        + jquery: `$('#id')`
    - By css class
        + vanilla: `document.getElementsByClassName('class')`
        + jquery: `$('.class')`
    - By tag
        + vanilla: `document.getElementsByTagName('tag')`
        + jquery: `$('tag')`
    - By attribute
        + vanilla: `document.querySelector('tag[attribute=value]')`
        + jquery: `$('tag[attribute=value]')`

## Chaining
* jQuery methods are always chainable
    - `$('#button').css('color: red').fadeOut(1000)`
* You should follow this rule whenever you write your own jQuery plugin

## Effects
* `fadeIn()`, `fadeOut()`
* `slideDown()`, `slideUp()`
* ...there's a bunch of them, read the docs: http://api.jquery.com/category/effects/
* Each animation usually take two optional parameters:
    - Speed in ms (default 400)
    - A callback to run after the animation ends
        + `fadeOut(1000, function(){...});`

## Events
* Event handlers
    - The vanilla way: `addEventListener()`
        + https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
    - The generic jQuery way: 
        + `on('event', function(event){...});` 
        + `bind('event', function(event){...});` 
        + Both are the same
    - The shortcuts
        + `click()` = `on('click', ...)`
        + `hover()` = `on('hover', ...)`
        + ... and so on
    - Event bubbling and how to control it
        + `event.preventDefault()` prevents the default browser action for an element (e.g. clicking an `<a>`, submit button on a form)
        + `event.stopPropagation()` stops the event from bubblling up through the DOM to containing elements
        + `event.stopImmediatePropagation()` will do the same **but also prevents other handlers on the same element from executing**.
 
## `document.ready()`
It's the way to find out if everything in the page has been loaded. If you're using jQuery, use their proposed pattern: 
```js
$(function(){
  // Your code here
});
```

## We also did a little AJAX intro!
* Intro to JSON APIs
* `$.ajax`, `$.get`, `$.post`, `$.getJSON`

The Clowns example is avaliable on the link below, along with the code discussed in class.

https://www.dropbox.com/s/zoqv0otjt0v9fxa/w6d2-jquery-clowns.tgz?dl=1

## Bonus - quick http server from any folder

If you have Python installed (you probably do), run this inside any folder to start a quick and dirty HTTP server for static files (better than opening `index.html` directly):
```sh
$ python -m SimpleHTTPServer
```
Then go to `http://localhost:8000` to see your project. Press `ctrl-c` to stop it. 

If you want to keep everything Javascript, you can also use the [node.js alternative](https://www.npmjs.com/package/http-server):
```sh
$ npm install -g http-server # Installs the server (only do this once)
$ http-server                # runs the server
```

It defaults to port 8080 instead, but it works the same way otherwise.
