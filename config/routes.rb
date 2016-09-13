Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index]

  resources :cart_items, only: [:create]
  # resources :cart, only: [:index], as: "cart"
  get '/cart', to: 'cart#index', as: "cart"

  get '/:category_name', to: 'categories#show'
end
