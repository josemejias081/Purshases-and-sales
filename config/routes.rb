Rails.application.routes.draw do
  resources :categories
  get 'home/welcome'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#welcome"
end
