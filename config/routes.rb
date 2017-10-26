Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :tweets

  get '/home', to: 'users#home'
  root to: 'users#home'

end
