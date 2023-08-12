Rails.application.routes.draw do
  resources :properties do
    match '/asset/:asset_id', to: 'properties#delete_images_attachment', via: [:delete], as: "delete_asset"
  end

  resources :events
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, :path => 'authenticate'
  resources :businesses
  resources :categories
  resources :products
  #resources :products, only: [:index, :create, :new]

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
   get 'news'   => 'home#news'
end
