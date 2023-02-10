Rails.application.routes.draw do
  devise_for :users
  resources :businesses
  resources :categories
  resources :products
  get 'home/welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#welcome"
end
