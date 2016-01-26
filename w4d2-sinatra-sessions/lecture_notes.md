# W3D2 - I remember you (a.k.a. cookies, sessions and MVC)

## Sinatra skeleton (https://github.com/lighthouse-labs/sinatra-skeleton)
* Loading order
    - It all starts with `config/environment.rb`, which requires everything else
    - To run a pry console on the context of your application, run this from the project root:

```shell
$ bundle exec pry './config/environment.rb'
```

* Rakefile
    - Contains useful bits of code that run in the context of your application. the format of the tasks is always:

```ruby
desc "description of what the task does"
task "taskname" do
  # Your ruby code goes here
end
```

Example: run pry in the context of the app.

```ruby
desc 'Development console'
task "console" do
  pry
end
```

## Cookies and sessions
* Cookies: It's all about remembering...
* Sessions: ...but we gotta be safe
* Using Chrome devtools
    - Danger! `document.cookie`

## Login flow
* Checking credentials (login/pass)
* Persisting a user session
* Logging out
* Sinatra helpers

Look at `actions.rb` in the code discussed in class for more details.

## Super quick intro to the Model-View-Controller pattern

* Model
    - Yes, we're talking ActiveRecord here
    - Has everything that concerns data, validations and business logic
* View
    - The part the user interacts with
    - In this context, we're talking about erb templates
    - Should contain as little logic as possible: iterations and conditionals, but nothing else
* Controller
    - Connects Views and Models
    - In this context, receives user's HTTP requests and deals with authentication

## Bonus: bash aliases

It's possible to create shortcuts to commands on the terminal using `alias`:
```sh
$ alias "be"="bundle exec"
$ alias "shot"="bundle exec shotgun -p 3000 -o 0.0.0.0"
```

From then on, you just have to type `be` for `bundle exec` and `shot` to start `shotgun` with all parameters. To make your aliases load automatically, edit the `.bash_profile` file in your home directory and add your aliases to the end.

## Code

The code discussed in class can be found at: 
https://www.dropbox.com/s/1ejokuo2w1jq6qj/w4d2-tunewall.tgz?dl=1
