Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :posts
  resources :users, only: [:new, :create] do
    resources :posts
  end



  # post '/users',     to: 'users#create'

  root 'users#new'
end
