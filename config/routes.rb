Rails.application.routes.draw do

  get '/home', to: 'tweets#index'
  root to: 'tweets#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :tweets


end
