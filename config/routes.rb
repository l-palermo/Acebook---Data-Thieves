Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  resources :users, only: [:new, :create] do
    resources :posts
  end
  get '/posts', to: 'posts#all'
  root 'sessions#new'
end
