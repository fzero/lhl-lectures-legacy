// Silly example module
// Note we're using the fat arrow syntax to create a variable
// and also using a default value for the parameter (ES6).

var hello = (name='everybody') => {
  // Template string, like Ruby!
  console.log(`HULLO ${name.toUpperCase()}!`)
}

module.exports = hello
