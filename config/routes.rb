Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  resources :users, only: [:new, :create] do
    resources :posts
  end
  root 'sessions#new'
end
