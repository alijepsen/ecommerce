Rails.application.routes.draw do
  root 'shared#home'

  get '/about', to: 'shared#about', as: 'about'

end
