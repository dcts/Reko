Rails.application.routes.draw do
  get 'registrations/after_sign_up_path_for'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  # custom users listing page
  get '/users', to: "users#index"
  resources :users, only: [:show] # get '/users/:id', to: "users#show", as: "user"
  # define landing page (at the moment the backend control panel)
  root to: 'pages#home'
  get 'thankyou', to: 'pages#thankyou'

  # get 'users/:id/rekos', to: 'rekos#index', as: "current_user"
  # beta applicants route
  resources :beta_applicants, only: [:new, :create]

  # rekos_routes
  resources :rekos, only: [:index, :new, :create] do
    put :mark_as_rejected
    put :mark_as_done
  end

  get '/rekos/new/invalid_token', to: "rekos#invalid_token", as: "invalid_token"

  resources :users, only: [:show] do
    resources :user_preferences, only: [:new, :create]
  end

  # ALL THE ADMIN ROUTES

  get '/admins/', to: "admins#home"
  get '/admins/users', to: "admins#users"
  get '/admins/users/:id', to: "admins#user", as: "admins_user"
  get '/admins/rekos', to: "admins#rekos"
  get '/admins/recommendables', to: "admins#recommendables"
  get '/admins/preferences', to: "admins#preferences"
  get '/admins/beta_applicants', to: "admins#beta_applicants"
  get '/admins/tests', to: "admins#tests"

end
