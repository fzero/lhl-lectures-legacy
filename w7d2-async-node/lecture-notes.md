# W7D2: Express.js vs. Sinatra, async programming and websockets intro

[Click here to download the code discussed in class!](https://www.dropbox.com/s/v5b89bnlo7jsi4z/w7d2-express-async-websockets.tgz?dl=1) It includes three folders:

- `/rb-nosleep` - Simple Sinatra webapp
- `/js-nosleep` - The same app in Node/Express
- `/websockets` - Quick websockets example

## Before everything: `npm`

Node.js comes with a package manager / task runner called [npm](https://www.npmjs.com/). It uses a JSON file called `package.json` to describe projects. It's like a cross between a Gemfile and a Rakefile where you put information about your project and depedencies. [Npm has extensive documentation](https://docs.npmjs.com/), but here's a quick cheatsheet:

* `npm init`
    * Creates a `package.json` file for your project by asking a few simple questions.
* `npm install --save <library>`
    * Installs a library and adds it to your `package.json` file
* `npm install -g <library>`
    * Installs a library globally and makes command-line utilities available.
    * Example: `npm install -g express-generator` and then you can use the `express` command from the terminal to start new projects.
* `npm install` in a folder with a `package.json` file
   * Installs all project dependencies.

## Node.js + Express = Javascript backend!

[Express.js](http://expressjs.com/) is a thin server library that provides features similar to Sinatra. On the one hand you have to write a bit more code (with callbacks, because Javascript); on the other hand, Express is *at least* 10 times faster than Sinatra and it's very easy to add support for websockets (see below). See the code discussed in class for a quick comparison between barebones projects.

### Template engines

* [EJS](http://ejs.co/) - Pretty much the same as ERB, but in Javascript.
* [Jade](http://jade-lang.com/) - Very popular engine with a indentation-based syntax.
* [Handlebars](http://handlebarsjs.com/) - Simple template engine that can also be used on the client side.

### Databases and ORMs

* [Bookshelf.js](http://bookshelfjs.org/) and [Sequelize.js](http://sequelizejs.com)
    * Very similar and capable SQL ORMs. Pretty much ActiveRecord for Node.
* [Mongoose](http://mongoosejs.com/)
    * ORM for MongoDB (NoSQL)
* [Waterline.js](http://waterlinejs.org/)
    * Multi-adapter ORM supporting both SQL and NoSQL databases at the same time. Used by Sails (see below).

### Libraries and frameworks that build upon Express

* [Sails](http://sailsjs.org/)
    * A Rails-like framework including templating engines, ORMs and easy creation of JSON APIs.
* [LoopBack](http://loopback.io/)
    * IBM-backed framework with a strong emphasis on building JSON APIs. Includes several tools to minimize writing repetitive code.
* [Hapi](http://hapijs.com/)
    * Backed by Walmart Labs. Includes several features that you'll likely have to include in an Express project anyway (logging, sessions, cookies, caching and so on). Provides useful conventions to organize the code, but it's more barebones than Sails or Loopback.

## Async programming and promises

Javascript applications rely on the **event loop**. Anything that accesses elements outside of the main application - HTTP requests, DOM elements, databases and so on - requires a callback function to handle the data being returned. That's why the pattern to handle requests in Express looks like this:
```js
// req = request information (headers, parameters...)
// res = response sent to the browser
app.get('/example/:thing', function(req, res) {
    res.send("Here's the thing: " + req.params.thing)
})
```

Since it's likely you'll have to handle callbacks inside callbacks, your code can get messy pretty quickly. That's why people smarter than us invented the *promise pattern*, so instead of writing:
```js
fs.readFile("file.json", function (err, val) {
    if (err) {
        console.error("unable to read file");
    }
    else {
        try {
            val = JSON.parse(val);
            console.log(val.success);
        }
        catch (e) {
            console.error("invalid json in file");
        }
    }
});
```

You can write:
```js
fs.readFileAsync("file.json")
.then(JSON.parse)
.then(function (val) {
    console.log(val.success);
})
.catch(SyntaxError, function (e) {
    console.error("invalid json in file");
})
.catch(function (e) {
    console.error("unable to read file");
});
```

There are several promise libraries avaliable, but the most used ones are [Q](http://documentup.com/kriskowal/q/) and [Bluebird](http://bluebirdjs.com/docs/getting-started.html). They use pretty much the same syntax, which is the same being officially adopted by ES6. [jQuery also has its own implementation of promises](http://api.jquery.com/promise/), and you can use it directly on AJAX requests and other situations.

## Websockets

Websockets are a relatively new protocol for real-time communications between browsers and servers. We'll have a more in-depth lecture about it this week, but you can see a quick example in the `/websockets` folder of the code discussed in class. We're using the [Socket.io](http://socket.io/) library in both Node and the browser to send messages back and forth and render them immediately.
