# Javascript in the browser!

* `window`, `navigator`
  * **BOM** - **Browser** Object Model
    * `navigator` represents the the browser basic code (or _kernel_) and properties, like version, user agent string, language, geolocation options and so on.
    * `window` is a "god object" containing all browser components, such as the address bar (`window.location`), modal dialogues (`alert()`, `prompt()`) and the window being displayed on screen itself. It's also the top object where all global variables are assigned to.
* `document`
  * **DOM** - **Document** Object Model
  * Contains all of the **content** being displayed - in other words, whatever is inside the `window`.
  * The `document` represents all content as nodes - tags, text, images, and so on.
  * The document API makes these nodes available to the Javascript engine
    * `document.getElementById` - find a single element using its `id`
    * `document.getElementsByClassName` / `document.getElementsByTagName` - find all elements by class or tag
    * `document.querySelector` - find a single element using a jQuery-like selector
    * `document.querySelectorAll` - find all elements matching a selector
* Events
  * `element.addEventListener` - attaches a function to an event. Examples:
    * `button.addEventListener('click', function(ev){...})` - run function when button is clicked
    * `document.addEventListener('mousemove', function(ev){...})` - run function when the mouse is moved
  * `DOMContentLoaded`
    * A useful event that's triggered when the page finishes loading
    * Usage: `document.addEventListener('DOMContentLoaded', function(){...})`
    * If you're using jQuery, you can use the `$(function(){...})` shortcut instead
  * Propagation
    * Events always propagate **outwards** from the innermost object - the one that's nested deeper in the document.
    * This means that if you click a `button` inside a `div` that's inside another `div`, **all three elements will receive the `click` event**.
    * To prevent propagation, use `event.stopPropagation()`

## Other considerations
* Javascript code is _asynchronous_ and _event-driven_. This means it will likely run **out of order**.
* Because of that, it's **really important to organize your code in short, simple functions**.
* This is especially useful when dealing with callbacks - and all events will require one.
* About DOM objects:
  * If an object can contain text or html, you can get and set its contents by using the `innerText` and `innerHTML` properties.
  * You can also get/set element attributes by using the `getAttribute()`/`setAttribute()` methods.
