Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  # custom users listing page
  get '/users', to: "users#index"
  resources :users, only: [:show] # get '/users/:id', to: "users#show", as: "user"
  # define landing page (at the moment the backend control panel)
  root to: 'pages#home'

  get 'users/:id/rekos', to: 'rekos#index', as: "current_user"
  # beta applicants route
  resources :beta_applicants, only: [:create]

  # rekos_routes
  resources :rekos, only: [:index]

  get '/inboxes/:token', to: "inboxes#show", as: "inbox"

  resources :contents, only: [:index]
end
