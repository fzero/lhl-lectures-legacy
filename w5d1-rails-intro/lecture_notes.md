# Intro to Rails

Today we talked about Rails and how it relates to the Sinatra work we've been doing so far. We've seen how Rails organizes the component parts of the application (Models, Views, Controllers, Tests) and discussed some of the add-ons that come built-in. Rails is a curated selection of components that can be changed if you want to, but that provides a pretty solid starting point for a full web application.

We've explored how rails can generate code for us - from migrations to full application scaffolds - and briefly discussed resourceful routing (to be explored in detail on the next lecture).

Slide deck: http://d.pr/f/14HuZ/12zl158E

Documentation about the rails command line, including generators and scaffolding: http://guides.rubyonrails.org/command_line.html

NOTE: For anyone curious, the problem I had on my setup was related to `spring`, which is something that keeps the rails server running on the background. If you run into the same issues (i.e. `rails` commands freezing up), run `pkill spring` on your terminal.
