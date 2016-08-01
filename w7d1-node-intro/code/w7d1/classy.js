'use strict';

class Computer {
  constructor(options) {
    this.brand = options.brand
    this.name = options.name
    this.ram = options.ram
    this.storage = options.storage
  }

  describe() {
    return `${this.brand} ${this.name} with ${this.ram}Gb of RAM and ${this.storage}.`
  }
}


class Laptop extends Computer {
  describe() {
    return `It's a laptop! ${super.describe()}`
  }
}


/* The same thing in ES5 style:
var Computer = function(options) {
  this.brand = options.brand
  this.name = options.name
  this.ram = options.ram
  this.storage = options.storage
}

Computer.prototype.describe = function() {
  return `${this.brand} ${this.name} with ${this.ram}Gb of RAM and ${this.storage}.`
}

// ES5 inheritance is a bit trickier, but also possible:
function Laptop(options) {
  Computer.call(this, options)
}

Laptop.prototype = Object.create(Computer.prototype)
Laptop.prototype.constructor = Laptop
Laptop.prototype.describe = function() {
  // no super though...
  return `It's a laptop! ${this.brand} ${this.name} with ${this.ram}Gb of RAM and ${this.storage}.`
}
*/

exports.Computer = Computer
exports.Laptop = Laptop
