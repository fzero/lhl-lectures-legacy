# Rails resources, routing and namespacing

Today we've discussed resourceful (a.k.a. RESTful) routing on Rails and how they map to controllers. We've seen how easy is to create nested routes and also touched on the subject of using slugs instead of numeric IDs. Lastly, we've discussed how to create namespaces to organize purpose-specific routes and controllers - the classic case being admin endpoints.

The Rails documentation is very comprehensive in this subject - and also very well-written. There's a lot you can do with routing, from basic pattern matching to access control based on user-agent, so be sure to read it! 
http://guides.rubyonrails.org/routing.html

The code used in the class can be found here: https://github.com/fzero/lh_rails_routes 

Be sure to look inside the `author.rb` model for notes on using slugs instead of ids for routing.

I've included the `web-console` gem and added it to the layout so you can play with the different path (`authors_path`, `new_author`, `author(id)` and so on) and link helpers (`link_to new_author`) right in the browser.

Bonus: as I always say, there's a gem for that! Check out FriendlyId at https://github.com/norman/friendly_id
