# Intro to Rails

Today we talked about Rails and how it relates to the Sinatra work we've been doing so far. We've taken a look at how Rails organizes the component parts of the application (Models, Views, Controllers, Tests) and discussed some of the add-ons that come built-in. Rails is a curated selection of components that can be changed if you want to, but that provides a pretty solid starting point for a full web application.

We've explored how rails can generate code for us - from migrations to full application scaffolds - and briefly discussed resourceful routing (to be explored in detail on the next lecture).

Slide deck: http://d.pr/f/14HuZ/12zl158E

Documentation about the rails command line, including generators and scaffolding: http://guides.rubyonrails.org/command_line.html

## Note on Rails versions

Rails 5 just came out, so Rails 4 is still the most common version out there. To create a project using a specific version, use the following command:

```sh
# Start a new project using Rails 4.2.4
$ rails _4.2.4_ new my_vintage_rails4_app

# To use the latest version, simply type
$ rails new my_shiny_rails5_app
```
