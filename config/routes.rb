Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  resources :posts
  post '/users',     to: 'users#create'

  root 'sessions#new'
end
