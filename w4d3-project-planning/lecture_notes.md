# Project planning (midterm)

Let's begin with some high-level rules:

## Rule #1

Time is short, so **KISS**!

**K**EEP **I**T **S**TUPID **S**IMPLE

or 

**K**EEP **I**T **S**IMPLE, **S**TUPID

(your pick)

## Rule #2

You need to be able to summarize what you want to accomplish in one sentence. Everything else comes after that.

This answers the first question: **WHAT?**

## Rule #3

Don't worry about implementation details at first, but make a list of what you'll need. Use this to break the problem you want to solve into its component parts.

This begins to answer the second question: **HOW?**

While you're doing this, remember **YAGNI**

**Y**ou **A**in't **G**onna **N**eed **I**t

Remove everything that feels optional. Ask yourselves what's the bare minimum for your idea to work. That's your Minimum Viable Product (MVP).

## Alright then, where do we go from here?

Don Burks made an amazing list of things to do next:
https://gist.github.com/donburks/9f47f22cc2fb54ac7396

But in short:

* Take your list of features and make user stories
    + Figure out the data you'll work with
        - Models!
        - Database tables!
        - Relationships!
    + Create workflows on how the users will provide that data and interact with it
        - Wireframes!
        - Storyboards!
    + It's always better to think from the perspective of the user, not what's easier to implement

## How to work as a team 

### Non-technical aspects

* **GIVE YOURSELF MILESTONES**
    - Set due dates
    - Set development targets
    - MEET THEM
    - USE TRELLO

* **SMART Goals**
    - Specific
    - Measurable
    - Achievable
    - Relevant
    - Time-based

### Technical aspects

* Use git!
    - `master` should always be _sane_
    - Use feature branching
    - Use database migrations and seeds
* Write tests if you can
    - `rspec` is your friend
* Good programmers are lazy
    - There's a Ruby gem for that
        + If you're using an external service, look for a gem
    - There's a Javascript library for that
        + If you're using an external service, look for a library
    - There's a CSS framework for that
        + John Chan hates Bootstrap. Don't listen to him.
    
---
Full lecture notes: https://gist.github.com/fzero/d908574641abc0499773
