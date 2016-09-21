Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :cart_items, only: [:create, :destroy, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'
  resources :users

  get '/admin/dashboard', to: 'admin/users#show'
  namespace :admin do
    resources :users, only: [:show, :update]
    resources :orders, only: [:update]
    resources :items, only: [:create, :new]
  end

  get '/cart', to: 'cart#index', as: 'cart'
  post '/cart', to: 'orders#create'
  get '/:category_name', to: 'categories#show'
end
