Rails.application.routes.draw do

  root to: 'parking_lots#index'

  resources :ratings

  resources :parking_lots do
    resources :ratings
    collection do
      # resources :ratings
      get :search
    end
    member do
      get :rate
      get :park
    end
  end

  resource :session, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

end
