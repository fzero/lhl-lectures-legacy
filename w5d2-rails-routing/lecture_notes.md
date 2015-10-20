# Rails routing, resources, namespacing and a bit of forms

Today we've discussed resourceful (a.k.a. RESTful) routing on Rails and how they map to controllers methods. These routes make your life easier by creating a single source of truth for URLs, plus a variety of helper methods to generate those URLs. We've also discussed nesting of resources (e.g `/articles/1/comments`) and namespacing (e.g. admin routes).

The Rails documentation is very comprehensive in this subject - and also very well-written. There's a lot you can do with routing, from basic pattern matching to access control based on user-agent, so be sure to read it! 

http://guides.rubyonrails.org/routing.html

We've also quickly discussed form helpers, which also stem from resourceful routes. They make it easier to generate forms in a way that prevents hard-coding url actions, and also make it trival to create forms that auto-fill whenever data is present (e.g. using the same form for `/new` and `/edit`) and creating more complex elements with pre-populated data, such as `<select>` elements. As always, the Rails docs are on point:

http://guides.rubyonrails.org/form_helpers.html

## Code

The code discussed in class can be found at the link below, and it includes additional notes and helpful comments. Be sure to take a look at `config/routes.rb` and the referenced controllers and models.

https://www.dropbox.com/s/vlxhzn6jubdx0st/w5d2-rails-routing.tgz?dl=0

Speaking of code:

### A note on slugs

Sometimes we want to find a resource by something other than their database id's - article titles for example. I've added this feature to the `Author` resource in the example code. This isn't provided _magically_ by Rails, but it isn't overly difficult either. Be sure to look inside the `author.rb` model for notes on using slugs instead of ids for routing. `AuthorsController` and `ArticlesController` also contain additional code to deal with this.

Bonus: as I always say, there's a gem for that! Check out FriendlyId at https://github.com/norman/friendly_id

### Web console

I've included the `web-console` gem and added it to the layout so you can play with the different path (`authors_path`, `new_author`, `author(id)` and so on) and link helpers (`link_to new_author`) right in the browser.

**IMPORTANT:** If you're running the code inside Vagrant you'll need to add this line inside the `Cms::Application.configure` block in`config/environments/development.rb`:

```ruby
config.web_console.whitelisted_ips = '10.0.2.2'
```
