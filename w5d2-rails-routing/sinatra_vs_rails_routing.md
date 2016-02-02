## Sinatra vs. Rails routing comparison

```
Rails                Sinatra                      Controller#action
===============      =====================        =================
resources :cats      get '/cats'                  CatsController#index
                     get '/cats/:id'              CatsController#show
                     get '/cats/new'              CatsController#new
                     post '/cats'                 CatsController#create
                     put/patch '/cats/:id'        CatsController#update
                     delete '/cats/:id'           CatsController#destroy

namespace :admin do  get '/admin/cats'            Admin::CatsController#index
  resources :cats    get '/admin/cats/:id'        Admin::CatsController#show
end                  get '/admin/cats/new'        Admin::CatsController#new
                     post '/admin/cats'           Admin::CatsController#create
                     put/patch '/admin/cats/:id'  Admin::CatsController#update
                     delete '/admin/cats/:id'     Admin::CatsController#destroy

resources :cats do   All RESTful routes plus:
  member do
    post :like       post '/cats/:id/like'         CatsController#like
  end
  collection do
    get :search      get '/cats/search'           CatsController#search
  end
end
```

### NOTES:

- It's possible to match more than one HTTP verb using `match`. Pass in an array with all HTTP verbs you want to use (or simply `:all`):

```ruby
resources :cats do
  member do
    match :like, via: [:get, :post]
    match :dislike, via: :all
  end
end
```

- You can use the `to:` parameter to use different controller/method names:

```ruby
match :logout, to: 'sessions#destroy', via: :all
```

- Whenever the user only has access to a single resource in the app (e.g. user profile), use a singular route. The main implementation difference is the absence of an `index` method or any other functionality that would allow seeing/editing more than one of that particular resource. **Note that we never pass `:id` to any of these routes; it's implied that you'll take care of that using sessions or other means.**

```
Rails                Sinatra                      Controller#action
===============      =====================        =================
resource :profile    get '/profile/new'           ProfilesController#new
                     get '/profile'               ProfilesController#show
                     get '/profile/edit'          ProfilesController#edit
                     post '/profile'              ProfilesController#create
                     put/patch '/profile'         ProfilesController#update
                     delete '/profile'            ProfilesController#destroy
```
