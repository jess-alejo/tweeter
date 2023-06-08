Rails.application.routes.draw do
  get 'errors/not_found'

  devise_for :users

  resources :tweets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"
end
