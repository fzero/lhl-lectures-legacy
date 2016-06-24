# Ruby Object Oriented Syntax 

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
        + shortcuts (`attr_accessor`)
    - Scopes (separate memory spaces)
        + regular variables -> restricted to a block
        + instance variables (`@variable`) -> restricted to instance
        + class variables (`@@variable`) -> available to all objects in a class
    - Instance vs. class methods
        + Using `self`
            * References the **current instance** inside instance methods
            * Used to define class methods whem used with `def`

