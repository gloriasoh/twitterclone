Rails.application.routes.draw do

  get '/home', to: 'tweets#home'


  root to: 'tweets#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, only: [:show]
  resources :tweets
  resources :followings, only: [:create, :destroy]


end
