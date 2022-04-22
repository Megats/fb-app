Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do  
    get '/admins/sign_out' => 'devise/sessions#destroy'     
  end

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :active_charts
  resources :user_charts
 
  # resources :users

  resources :users do
    resources :posts do
      resources :comments
    end
  end

  resources :admins do
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


  root to: 'posts#index'
  get 'pages', to: 'pages#index'
  get 'signup', to: 'users#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
