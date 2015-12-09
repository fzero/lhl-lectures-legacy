# Rails: ActionMailer and Background jobs

## How to send emails from a Rails app

As always, the docs are excellent:
http://guides.rubyonrails.org/action_mailer_basics.html

**Steps:**

1. Generate a mailer
    * `bin/rake g mailer UserMailer`
2. Add a method for each email you want to send
    * e.g. `welcome_email`
3. Edit mailer layout and views
    * Layouts work exactly like you expect them to
    * Each different mailer method should have a different view

### Configuring the mailer

* The settings should be made inside the `Rails.application.configure` block
* You **must** add the SMTP configuration by hand. 
* Each environment can have a different configuration.
* `development` and `test` don't send emails by default
    - `test` stores emails inside a special array: `ActionMailer::Base.deliveries`

Example SMTP config block:

```ruby
config.action_mailer.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587,
  :user_name => ENV[:email],
  :password  => ENV[:password],
  :authentication => :login,
  :enable_starttls_auto => true
} 
```

Mandrill is a good service to use for transactional emails:
http://mandrill.com

## Background jobs

Some operations take too much time to complete during a request:
* Resizing images
* Sending emails
* Generating summaries and reports

We don't want to leave the user waiting for the server **or** the server waiting for an operation to complete while it could be handling more requests. For those situations, you want to use background jobs.

#### Rules of background jobs

* Think of them almost as separate apps
* Things _can_ and _will_ run out of order
    - Double check to make sure something hasn't been processed already
* Things _can_ and _will_ fail
    - Make sure to catch errors
    - Implement retries whenever necessary

### Rails 4.2+ has native support for this

http://edgeguides.rubyonrails.org/active_job_basics.html

Yes, you get generators:
```sh
$ bin/rails generate job MyBackgroundJob
```

You'll still need a queuing backend. Most popular gems:

* Sidekiq: http://sidekiq.org
    - Github: https://github.com/mperham/sidekiq
    - Docs: https://github.com/mperham/sidekiq/wiki
* Resque: https://github.com/resque/resque
* DelayedJob: https://github.com/collectiveidea/delayed_job/tree/v4.1.1

Sidekiq and Resque are more popular, but need `redis` to work, while DelayedJob can use a regular SQL database.

Installing redis on Vagrant (and Debian Linux):
```sh
$ sudo apt-get install redis-server
```

Mac OS X with Homebrew:
```sh
$ brew install redis-server
```

Then run it with `redis-server`. Use `redis-cli` to connect to it directly. More information on Redis: http://redis.io

#### Using `ActiveJob` with `Sidekiq`

https://github.com/mperham/sidekiq/wiki/Active-Job

#### VERY IMPORTANT: Queues are processed separately!

Running `bin/rails c` or `bin/rails s` **WILL NOT** start the queue workers! They need be started separately (that's the whole point after all - running things separately from the main app). The way to do this changes depending on the backend.

For Sidekiq, make sure Redis is running (`redis-server` on a terminal window) and then run `bin/bundle exec sidekiq`.

You will see something like this:

```
$ bin/bundle exec sidekiq
2015-10-15T15:14:25.786Z 5531 TID-ovac5j7js INFO: Booting Sidekiq 3.5.1 with redis options {:url=>"redis://localhost:6379"}


         m,
         `$b
    .ss,  $$:         .,d$
    `$$P,d$P'    .,md$P"'
     ,$$$$$bmmd$$$P^'
   .d$$$$$$$$$$P'
   $$^' `"^$$$'       ____  _     _      _    _
   $:     ,$$:       / ___|(_) __| | ___| | _(_) __ _
   `b     :$$        \___ \| |/ _` |/ _ \ |/ / |/ _` |
          $$:         ___) | | (_| |  __/   <| | (_| |
          $$         |____/|_|\__,_|\___|_|\_\_|\__, |
        .d$$                                       |_|

2015-10-15T15:14:26.257Z 5531 TID-ovac5j7js INFO: Running in ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]
2015-10-15T15:14:26.257Z 5531 TID-ovac5j7js INFO: See LICENSE and the LGPL-3.0 for licensing details.
2015-10-15T15:14:26.257Z 5531 TID-ovac5j7js INFO: Upgrade to Sidekiq Pro for more features and support: http://sidekiq.org
2015-10-15T15:14:26.257Z 5531 TID-ovac5j7js INFO: Starting processing, hit Ctrl-C to stop
```

Queues will log things independently from the main app, so bear this in mind when looking for errors.

Sidekiq will look at the `default` queue if you don't add any options. To look for different queues (the special `mailers` queue that Rails uses for `deliver_later`, for example), just use the `-q` command line option for each queue:

```
$ bin/bundle exec sidekiq -q default -q mailers
```

You can always check all available options with `sidekiq --help`.

#### A note on Node.js

There's a Sidekiq library for Node.js:

* https://www.npmjs.com/package/sidekiq
* https://github.com/loopj/node-sidekiq

Note that it only provides an interface to **enqueue** jobs, not to process them. This means you'll still need to write the background processing code in Ruby.

## Sending emails on a background job

Thanks to `ActiveJob`, it can be as simple as:
```ruby
UserMailer.welcome_email(@user).deliver_later
```

Email tasks are going to be added to the `mailers` queue by default. To override this:
```ruby
UserMailer.welcome_email(@user).deliver_later(queue: :default)
```

## Caching in general

For static resources like CSS, Javascript files, images and so on, it's possible to cache the entire request. This is done by default by all CDNs (Amazon S3, Cloudflare etc.) and also by Rails. This is the simplest caching situation - the file won't change at all for months sometimes. Browsers will check servers for headers before doing a full request, and this includes assessing the _freshness_ of the content by comparing timestamps and ETags.

BUT! This doesn't work for dynamic apps with logged-in pages and content specific to users.

## Rails caching

Docs: http://guides.rubyonrails.org/caching_with_rails.html

Rails has one of the best caching frameworks out there. It makes it possible to cache fragments of the page instead of the whole thing. It also handles most of the anoying parts for you!

The docs are very good in this case, but the general idea is wrapping parts of views inside `cache` blocks, like so:

```erb
<% cache(@users) do %>
  <% @users.each do |user| %>
    <tr>
      <td><%= user.name %></td>
      <td><%= user.email %></td>
      <td><%= user.subscribed %></td>
      <td><%= link_to 'Show', user %></td>
      <td><%= link_to 'Edit', edit_user_path(user) %></td>
      <td><%= link_to 'Destroy', user, method: :delete, data: { confirm: 'Are you sure?' } %></td>
    </tr>
  <% end %>
<% end %>
```

Rails detects when `@users` is updated and invalidates the cache accordingly. Whenever the cache is fresh, the app won't hit the database to get the list of users. It's also possible to nest caching blocks - this is called **russian doll caching**:

```erb
<% cache(cache_key_for_products) do %>
  All available products:
  <% Product.all.each do |p| %>
    <% cache(p) do %>
      <%= link_to p.name, product_url(p) %>
    <% end %>
  <% end %>
<% end %>
```

## Code discussed in class

Download it at: 
https://www.dropbox.com/s/wqdueb70qwjnji2/w8d4-rails-mailer-bgjobs-caching.tgz?dl=0
