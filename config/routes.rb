Rails.application.routes.draw do
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  # Defines the root path route ("/")
  root "products#index"
  get 'users/new', to: 'users#new'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete "signout", to: "sessions#destroy", as: 'session'

end
