Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :items, only: [:index, :show]
  resources :users

  resources :cart_items, only: [:create, :destroy]

  get '/cart', to: 'cart#index', as: 'cart'

  get '/:category_name', to: 'categories#show'
end
