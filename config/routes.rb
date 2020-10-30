Rails.application.routes.draw do
  # get 'password_resets/new'
  root 'repos#index'

  # routes all 
  resources :forums
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
  resources :password_resets
  resources :repos

  # # routes from provider callbacks 
match '/auth/:provider/callback', to: 'sessions#callback', :via => [:get, :post]
end
