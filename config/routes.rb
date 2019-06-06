Rails.application.routes.draw do
  get 'registrations/after_sign_up_path_for'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  post '/users/switch_random_avatar', to: "users#switch_random_avatar"

  # landing page and thankyou page
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
  get '/rekos/new/onboarding', to: "rekos#onboarding"
  get '/rekos/new/invalid_token', to: "rekos#invalid_token", as: "invalid_token"

  #  Users & User Preferences
  resources :users, only: [:show] do
    resources :user_preferences, only: [:new, :create]
  end

  #  Feedback
  post '/feedbacks', to: 'feedbacks#create', as: 'new_feedback'


  # ALL THE ADMIN ROUTES
  get '/admins/', to: "admins#home"
  get '/admins/users', to: "admins#users"
  get '/admins/users/:id', to: "admins#user", as: "admins_user"
  get '/admins/rekos', to: "admins#rekos"
  get '/admins/recommendables', to: "admins#recommendables"
  get '/admins/preferences', to: "admins#preferences"
  get '/admins/beta_applicants', to: "admins#beta_applicants"
  get '/admins/tests', to: "admins#tests"
  get '/admins/allan', to: "admins#allan"
  get '/admins/feedbacks', to: "admins#feedbacks"
  get '/s/:id', to: "shorten_links#show", as: :shorten_link

end
