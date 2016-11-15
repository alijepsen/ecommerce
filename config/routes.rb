Rails.application.routes.draw do
  devise_for :users
  root 'shared#home'

  get '/about', to: 'shared#about', as: 'about'

  get 'all_products', to: 'products#all_products'

  resources :carts do
  	resources :products
  end

  resources :categories do
  	resources :products
  end

  resources :products do
  	resources :comments
  end

end
