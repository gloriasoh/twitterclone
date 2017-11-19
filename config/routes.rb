Rails.application.routes.draw do

  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  get '/home', to: 'tweets#home'


  root to: 'tweets#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users, only: [:show]
  resources :tweets
  resources :followings, only: [:create, :destroy]


end
