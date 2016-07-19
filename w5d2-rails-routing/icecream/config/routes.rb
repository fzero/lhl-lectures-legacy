Rails.application.routes.draw do
  resources :ice_creams do
    collection do # doensn't expect an id
      get :search
    end
    member do # expects an id
      get :enjoy
    end
    resources :toppings
  end

  resources :toppings

  namespace :admin do
    resources :toppings
  end
end
