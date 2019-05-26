Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  # custom users listing page
  get '/users', to: "users#index"
  resources :users, only: [:show] # get '/users/:id', to: "users#show", as: "user"
  # define landing page (at the moment the backend control panel)
  root to: 'pages#home'
  # rekos_routes
  resources :rekos, only: [:index]
end
