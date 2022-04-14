Rails.application.routes.draw do

  resources :users

  resources :users do
    resources :posts do
      resources :comments
    end
  end
  
  resources :posts do
    resources :comments 
  end  

resources :posts do
  resources :likes, only: [:create, :destroy]
end


resources :comments do
  resources :likes, only: [:create, :destroy]
end

  root to: 'users#index'
  get 'pages', to: 'pages#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
