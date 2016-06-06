let hello = require('./module.js')
let Require = require('request')

console.log("Welcome to my super awesome node app!")
hello()

Require('http://www.google.com', (error, response, body) => {
  if (!error && response.statusCode == 200) {
    console.log(`google.com is ${body.length / 1024} Kbytes long.`)
  }
})
