Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, :path => 'authenticate'
  resources :businesses
  resources :categories
  resources :products
  #get 'home/welcome'
  resources :users do
    get "reset_password"
  end

  resources :users do
    resources :businesses
  end

  resources :businesses do
    resources :products
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#welcome"
   get 'contact'   => 'home#contact'
end
