# W7D1: Node.js intro

## What is Node?

In a nutshell, [Node.js](https://nodejs.org/en/) is [Chrome's Javascript engine (V8)](https://developers.google.com/v8/) running outside of the browser with simple tools to create server-side applications.

## Before everything: `npm`

Node.js comes with a package manager / task runner called [npm](https://www.npmjs.com/). It uses a JSON file called `package.json` to describe projects. It's like a cross between a Gemfile and a Rakefile where you put information about your project and depedencies. [Npm has extensive documentation](https://docs.npmjs.com/), but here's a quick cheatsheet:

* `npm init`
    * Creates a `package.json` file for your project by asking a few simple questions.
* `npm install --save <library>`
    * Installs a library and adds it to your `package.json` file
* `npm install --save-dev <library>`
    * Same thing, but install the library as a development dependency on `package.json`. Use this for linters, compilers, builders and anything else that won't be needed for the app to run in production, but will be useful during development.
* `npm install -g <library>`
    * Installs a library globally and makes command-line utilities available.
    * Example: `npm install -g express-generator` and then you can use the `express` command from the terminal to start new projects.
* `npm install` in a folder with a `package.json` file
   * Installs all project dependencies.

## ES6 features

V8 incorporates most features from the ES6 spec, like block-scoped variables using `let`, proper `class`es, `const`ants, template strings, default function parameters, a shorthand syntax for creating functions (_fat arrows_) and so on. Most of these features are also available on recent Chrome, Firefox and Edge versions, but there are implementation differences between them that turn this into a risky proposition.

On the other hand, Node runs on the server, so you can have fun playing with them without breaking things for your users.

## Things you DON'T get to do

Since there's no browser, there's no `window`, `document` or DOM. `console` prints to the terminal.

## Things you CAN do

You can now read and write to files using the [`fs` (file system) module](https://nodejs.org/api/fs.html), serve HTTP requests and so on. It's a server after all.

## Working with modules

The only way to load Javascript on the browser is by using a `<script>` tag. There's no such thing on the server side, and it isn't practical to put everything on a single file either, so Node introduces modules.

### Creating a module

A module is a normal JS file that **exports functions and values to be used by other modules**. Example:
```js
// Silly example module
// Note we're using a few ES6 features: fat arrow syntax to create a function,
// a default value for the parameter and template strings like in Ruby.

var hello = (name='everybody') => {
  console.log(`HULLO ${name.toUpperCase()}!`)
}

// Use `module.exports` when your module only exports one object.
// To export more objects, assign them to `exports.object_name`.
// The line below is the same as doing `exports.hello = function(...){...}` in the example above.
module.exports = hello
```

### Using a module

Use `require` to store the exported module objects inside a variable for further use. Remember that functions are values in Javascrtipt!
```js
let hello = require('./module.js')

hello()
//=> HULLO EVERYBODY!
```

### Libraries installed with `npm install` are modules too

When you run `npm install` on a project, it will look at `package.json` and install all dependencies on the `node_modules` folder. From then on, you can load them with a regular `require` (no need to include the full path).
```sh
# Installs the request library (https://github.com/request/request)
# This will update the package.json file
$ npm install request --save
```
```js
// On your js file
let Request = require('request')

// Gets google.com and counts the bytesize
Request('http://www.google.com', (error, response, body) => {
  if (!error && response.statusCode == 200) {
    console.log(`google.com is ${body.length / 1024} Kbytes long.`)
  }
})
```

**Note:** Be sure to add `node_modules` to your `.gitignore` file. It will be re-created every time you run `npm install`.

## Express

[Express](http://expressjs.com/) is to Node what Sinatra is to Ruby. It's a lightweight HTTP server that can be used by itself or as part of several larger projects, like [Nodal](http://www.nodaljs.com/), [Sails](http://sailsjs.org/), [Hapi](http://hapijs.com/), [Strapi](http://strapi.io/) and so on.

The easiest way to use it is by installing the `express-generator` package. It will build an app skeleton you can start working on right away.
```
$ npm install -g express-generator
$ express --help

  Usage: express [options] [dir]

  Options:

    -h, --help          output usage information
    -V, --version       output the version number
    -e, --ejs           add ejs engine support (defaults to jade)
        --hbs           add handlebars engine support
    -H, --hogan         add hogan.js engine support
    -c, --css <engine>  add stylesheet <engine> support (less|stylus|compass|sass) (defaults to plain css)
        --git           add .gitignore
    -f, --force         force on non-empty directory
```

### Template engines

* [EJS](http://ejs.co/) - Pretty much the same as ERB, but in Javascript.
* [Jade](http://jade-lang.com/) - Very popular engine with indentation-based syntax.
* [Handlebars](http://handlebarsjs.com/) - Simple template engine that can also be used on the client side.

### Databases and ORMs

* [Bookshelf.js](http://bookshelfjs.org/) and [Sequelize.js](http://sequelizejs.com)
    * Very similar and capable SQL ORMs. Pretty much ActiveRecord for Node.
* [Mongoose](http://mongoosejs.com/)
    * ORM for MongoDB (NoSQL)
* [Waterline.js](http://waterlinejs.org/)
    * Multi-adapter ORM supporting both SQL and NoSQL databases at the same time. Used by Sails and Strapi.

