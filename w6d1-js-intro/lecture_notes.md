## What is Javascript? Where did it come from?

JS was created in 1995 by Brendan Eich at Netscape First, and the first version was written in TEN DAYS! (What could possibly go wrong?)

Despite the name, it doesn't have much in common with Java, except the name and C-like syntax (curly braces, parentheses and so on).

```
  // Java: You MUST create classes and define types
  class myfirstjavaprog {
    public static void main(String args[]) {
      System.out.println("Hello World!");
    }
  }

  // Javascript: Just do it™
  console.log("Hello World!");
```

### The good parts
* It's everywhere - to the point it's pretty much unavoidable
* Easy enough to learn
* Very effective and performant
* First-class functions (more on this soon)
* Asynchronous and non-blocking

### The bad parts
* It's TOO asynchronous - callbacks for everything!
* Not everything works the same way everywhere
* Two different versions in use (ES5/ES6)
* The ecosystem changes so fast it's hard to keep up
* [It's a somewhat idiosyncratic language...](https://www.youtube.com/watch?v=20BySC_6HyY)

## Main features

Dynamically typed (a.k.a duck-typing, just like Ruby)
```javascript
  "This is the number " + 1;
  //=> "This is the number 1" // I totally got your back, bro!
```

Functional (functions are also values)
```javascript
  var myFunction = function() {
    // Some code...
  }
  otherFunction("something", myFunction);
```

Object-based (but NOT Object Oriented!)
```javascript
  ['Good', 'morning'].join(' ');
  //=> "Good morning"

  class myClass(){};
  //=> Uncaught SyntaxError: Unexpected token class
```


## Data types
```javascript
  // Number
  1, 10, 521, 0.5, 0xF0

  // String
  'a', "puppy", 'Kitten', "Supercalifragilisticexpialidocious"

  // Boolean
  true, false

  var falsey = '';
  if (falsey) console.log("This will never be printed");

  var truthy = 50;
  if (truthy) console.log("On the other hand, this will");
  //=> "On the other hand, this will"

  // Array
  var arr = [1, 5, "banana", ['a', 'b', 'c'], {where: "The Moon"}]

  arr[2]
  //=> "banana"

  arr[3]
  //=> ['a', 'b', 'c']

  // Object
  var myObj = {one: 1, monster: "Frankenstein", anArray: [1, 2, 3]};

  myObj.one
  //=> 1

  myObj["monster"]
  //=> "Frankenstein"

  myObj.anArray[1]
  //=> 2

  // Function
  var sayHello = function(name) {
    console.log("Hello " + name);
  }

  // Others
  NaN, undefined, null
```

## Comparisons

Javascript has _two_ different ways to compare values.
```javascript
  // ==, >=, <= and != will do type conversions on the fly.
  // All comparisons below will return true

  '1' == 1
  0 == false
  '' == false
  0 == ''
  [] == ''
  [] == 0
  '5' <= 10

  // === and !== will also compare types
  // All comparisons below will return false

  '1' === 1
  0 === false
  '' === false
  0 === ''
  [] === ''
  [] === 0
```

## Functions and scopes

Functions are exactly like methods and are the only available scope in Javascript. This means **_all_** variables are global unless defined inside a function.
```javascript
  var global = "I'm everywhere";

  function logStuff() {
    var local = "I'm a local variable";

    console.log(local);
    console.log(global);
  }

  logStuff();
  //=> "I'm a local variable"
  //=> "I'm everywhere"

  console.log(local);
  //=> Uncaught ReferenceError: local is not defined
```

BUT! You can have functions inside functions:
```javascript
  var global = "I'm everywhere";

  function outerFunction() {
    var local = "I'm a local variable";

    function innerFunction() {
      var innerLocal = "I'm even more local";

      console.log(innerLocal);
      console.log(local);
      console.log(global);
    }
  }

  outerFunction();
  //=> "I'm even more local"
  //=> "I'm a local variable"
  //=> "I'm everywhere"
```

## Closures!

We already know we can return functions as values, but the cool thing is they _always keep their internal scope_ (local variables and such) and pass them along. This function+data package is called a _closure_:
```javascript
  function multiplier(factor) {
    return function(number) {
      return number * factor;
    };
  }

  // The function being returned will remember the factor parameter!
  var twice = multiplier(2);

  twice(5);
  //=> 10

  multiplier(5)(3); // BTW This also works
  //=> 15
```

## Back to Objects
They're kinda like Ruby hashes, but can also contain functions.
```javascript
var myObj = {
  colour: "blue",
  number: 5,
  fruits: ["Apple", "Orange", "Avocado"],
  getFruit: function(fruit_index) {
    return this.fruits[fruit_index];
  }
}

myObj.colour;
//=> "blue"

myObj.getFruit(2);
//=> "Avocado"
```

## What about classes?
Javascript has no classes! Everything is either a value or a function.
You can fake classes using functions:
```javascript
  function Apple(type) {
    this.type = type;
    this.color = "red";
    this.getInfo = function() {
      return this.color + ' ' + this.type + ' apple';
    };
  }

  var apple = new Apple('macintosh');
  apple.color = "reddish";

  console.log(apple.getInfo());
  //=> "reddish macintosh apple"
```

### This actually introduces a problem
```javascript

  var apple = new Apple('macintosh');

  console.log(apple.getInfo());
  //=> "red macintosh apple"

  Apple.getInfo = function() {
    return "LOL I'VE CHANGED THIS!";
  }

  console.log(apple.getInfo());
  //=> "red macintosh apple" -- WAT!?
```

### So there's no inheritance?
Not in the `class` sense, but you have `prototype`.
```javascript
  function Apple(type) {
    this.type = type;
    this.color = "red";
  }

  Apple.prototype.getInfo = function() {
    return this.color + ' ' + this.type + ' apple';
  };

  var apple1 = new Apple('macintosh');
  var apple2 = new Apple('gala');

  console.log(apple2.getInfo());
  //=> "red gala apple"

  Apple.prototype.getInfo = function() {
    return "LOLOLOL NOPE"
  };

  console.log(apple1.getInfo());
  //=> "LOLOLOL NOPE"

  console.log(apple2.getInfo());
  //=> "LOLOLOL NOPE"
```

## JavaScript is Asynchronous
Most of the time, a JS program does not wait for a function to finish
before it moves on to execute the next line of code.

Let's say we want to write code that prints out `hello`
and then 4 seconds later, it prints out `bye`. In Ruby we would write this:
```ruby
puts "hello"
sleep(4)
# Ruby waits until the sleep is done
puts "bye"
```

In Javscript this won't work:
```javascript
console.log("hello");
setTimeout(undefined, 4000);
console.log("bye");  // runs immediately
```

What now? Enter the guys you'll love to hate...

## Callbacks!
```javascript
console.log("hello");
setTimeout(function(){
  console.log("bye");
}, 4000);
```

`setTimeout` takes two parameters: a function to run and a number of miliseconds to wait.

### Typical use: AJAX
```javascript
// This bit of code is using jQuery to fetch test data

var url = 'http://httpbin.org/get?name=Fabio&power=9001';

$.get(url, function(data) {

  // result is a property of the data object
  var contents = data.result;
  console.log(contents);

  // If you want to run code after the request is done, put it here
  console.log("Done for real");
});

// Javascript makes the get request
// and then it immediately runs the code below
console.log("I'm done! WAT?");
```

The request goes through wihout blocking the browser.

## Common JS libraries

### [Sugar.js](http://sugarjs.com/), [Underscore](http://underscorejs.org/)/[Lodash](https://lodash.com/)
Add missing language features, like `.each` for arrays, string
templates (`#{}` in Ruby) and so on.

### [jQuery](http://jquery.com/)
Unified, browser-independent API to deal with HTML elements, make
AJAX requests, run animations and so on. The kitchen sink of client-side
development!

## Frameworks

### [Angular.js](https://angularjs.org/)
Google's own front-end framework.

### [Ember.js](http://emberjs.com/)
Same idea, but with batteries included, convention over configuration
and code that's a bit more legible (IMHO).

### [React](http://reactjs.com/)/[Flux](https://facebook.github.io/react/blog/2014/05/06/flux.html)
Facebook's response to Angular (kinda sorta). Hugely popular these days!

## A note on Javascript versions

The most compatible version of Javascript right now is known as ECMAScript 5 (a.k.a. ES5). It's what runs in most browsers today.

A new version called ES6 (or ES2015) works natively in [node.js](http://nodejs.org/) and can also be used in browsers if the code is _transpiled_ with tools like [Babel.js](http://babeljs.io/). Some frameworks like React and Angular won't work without transpiling.

ES6 adds features that make JS better for large projects, including proper classes (while keeping prototypical inheritance), modules, better callback handling, ruby-like string templates and so on.

## BONUS: Assignment notes

* [JSFiddle](http://jsfiddle.net) is awesome, but it doesn't show console output; the *Results* pane will only display HTML generated by your code. You'll have to open the browser development tools to check those (cmd+shift+i/ctrl+shift+i).
* Multi-line strings in Javascript are written like this:
```javascript
var myStr = "This is my \
multi-line string, and it looks \
absolutely horrible - just like \
a callback pyramid!";
```

Bear in mind I've **never** seen anybody use strings like this, especially because you'll accidentally add unwanted spaces if you indent your code:

```javascript
var myStr = "This is my \
             multi-line string, and it looks \
             absolutely horrible - just like \
             a callback pyramid!";
//=> "This is my              multi-line string, and it looks              absolutely horrible - just like              a callback pyramid!"
```

Because of that, this pattern is still prevalent:
```javascript
var myStr = "This is my " +
            "multi-line string, and it looks " +
            "slightly less worse now.";

//=> "This is my multi-line string, and it looks slightly less worse now"
```

### Javascript REPL on the terminal

You'll need [Node.js](http://nodejs.org) for that. Here's how to install it.

On vagrant:
```
sudo apt-get update
sudo apt-get install node
```
On OS X with homebrew:
```
brew update
brew install node
```
After that you can run `node` on the terminal and play with Javascript. Bear in mind you won’t have any browser features this way.

### How to work in Sublime Text (or other editor) and run code in the browser

You'll need to load your code in the browser. The best way to do it is to use a simple HTML file:
```html
<html>
  <head>
    <script src="my_script.js"></script>
  </head>
  <body>
    <p>All the action is in the console!</p>
  </body>
</html>
```
Save it, open in on the browser and you're good to go. Reload it everytime you change `my_script.js`.
