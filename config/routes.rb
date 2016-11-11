Rails.application.routes.draw do
  root 'shared#home'

  get '/about', to: 'shared#about', as: 'about'

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
