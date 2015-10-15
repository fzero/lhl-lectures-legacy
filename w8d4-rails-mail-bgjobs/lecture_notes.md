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

You'll still need a queuing backend. Most popular gems:

* Sidekiq: http://sidekiq.org
    - Github: https://github.com/mperham/sidekiq
    - Docs: https://github.com/mperham/sidekiq/wiki
* Resque: https://github.com/resque/resque
* DelayedJob: https://github.com/collectiveidea/delayed_job/tree/v4.1.1

Sidekiq and Resque are more popular, but need `redis` to work, while DelayedJob can use a regular SQL database.

#### Using `ActiveJob` with `Sidekiq`

https://github.com/mperham/sidekiq/wiki/Active-Job

## Sending emails on a background job

Thanks to `ActiveJob`, it can be as simple as:

```ruby
UserMailer.welcome_email(@user).deliver_later
```

