Rails.application.routes.draw do


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  get '/users/new',  to: 'users#new'
  post '/users',     to: 'users#create'

  root 'sessions#new'

  resources :users, only: [:new, :create] do
  resources :posts
  end

end
