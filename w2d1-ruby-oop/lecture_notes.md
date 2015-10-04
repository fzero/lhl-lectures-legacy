# Object Oriented Programming in Ruby

First a little recap!

## Procedural
Code and data are separate entities; the code receives input data, processes it and outputs modified data. There's absolutely nothing wrong with it, and it may be the right choice for _very_ simple projects (scripts etc.).

## Object Oriented
Instead of simply acting upon data, the code is written in a way that describes _things_ (**objects**) having properties and behaviours (**methods**). Every different object belongs to a **class**, which describes all properties and methods that each **instance** of that class of objects can have.

### Classes

* Everything is an object and every object has a class
    - All objects inherit from `Object` (which inherits from `BasicObject`!) or `Kernel`
    - Use `<Object>.class` to find out the class
    - Use `<Class>.superclass` to find out the parent class
* How to create a class
    - `initialize`
        + defining properties (instance variables)
        + reading properties (getters, `attr_reader`)
        + changing properties (setters, `attr_writer`)
        + shortcuts (`attr_accessible`)
    - Scopes (separate memory spaces)
        + regular variables -> restricted to a block
        + instance variables -> restricted to object
        + class variables -> available to all objects in a class
    - Instance vs. class methods
        + Using `self`

### Inheritance

* It's all about reusing code
* Each subclass should be a specialization of the parent class
* Using `super` to specialize an inherited method


# Exceptions - handling errors

* It's what happens when things go wrong
    - Reading exceptions and backtraces
    - Using `raise` to create an exception
* How to deal with it
    - `begin` and `rescue`
    - Rescuing specific errors
* Custom exception classes
    - Create a class inheriting from `StandardError`
        + There's not much else to do unless you want to add custom stuff
    - http://blog.honeybadger.io/ruby-custom-exceptions
