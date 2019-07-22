Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  resources :posts
  post '/users',     to: 'users#create'
  get '/users/new',     to: 'users#new'
  root 'sessions#new'
end
