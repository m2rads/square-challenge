Rails.application.routes.draw do
  devise_for :users
  # get 'site/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: 'site#index'

  # get 'auth/:provider/callback', to: 'sessions#create'
  root to: 'site#index'
  
  devise_for :users, controllers: {omniauth_callbacks: "callback"}


  # resources :retailers
  
  # resources :customers, except: [:new, :edit] do
  #   get 'associated_retailers', on: :member
  # end

  # # post '/customers', to: 'customers#create'

  # get '/not_found', to: 'site#not_found'

  # match '*path', to: 'site#not_found', via: :all

end
