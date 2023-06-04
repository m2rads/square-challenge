Rails.application.routes.draw do
  # get 'site/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'site#index'

  get 'square/link_account', to: 'square#link_account', as: 'square_link_account'
  get 'square/callback', to: 'square#callback', as: 'square_callback'

  resources :retailers
  
  resources :customers, except: [:new, :edit] do
    get 'associated_retailers', on: :member
  end

  post '/customers', to: 'customers#create'

  get '/not_found', to: 'site#not_found'

  match '*path', to: 'site#not_found', via: :all

end
