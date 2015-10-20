Cms::Application.routes.draw do

  root "articles#index"

  # These routes give direct REST access to our resources
  resources :authors
  resources :articles
  resources :comments

  # These make it possible to get to comments through articles, like:
  # /artcicles/1/comments
  resources :articles do
    resources :comments do
      # Here we're defining a route that doesn't need an id to return data.
      # Usually they also return a collection of items
      # /articles/1/search
      collection do
        get :search
      end
      # Here we're defining a route that acts upon a single resource.
      # It MUST take an id to do anything useful.
      # /articles/1/comments/1/favourite
      member do
        post :favourite
      end
    end
  end

  # /authors/...
  resources :authors do
    # /authors/1/articles/...
    resources :articles do
      # /authors/1/articles/1/comments/...
      resources :comments
    end
  end

  # This creates a namespace called /admin
  # All controllers and views referenced below should be put inside a
  # /admin subdirectory inside /app/controllers
  namespace :admin do
    # This will look for /app/controllers/admin/users_controller.rb,
    # and all views should be under /app/views/admin/users/
    resources :users
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  # post 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
