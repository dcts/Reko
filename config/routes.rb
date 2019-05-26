Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  # custom users listing page
  get '/users', to: "users#index"
  # define landing page (at the moment the backend control panel)
  root to: 'pages#home'
end
