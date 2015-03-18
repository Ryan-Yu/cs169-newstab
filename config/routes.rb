Rails.application.routes.draw do
  
  resources :groups

  resources :articles
  
  # We must declare a path prefix for devise user operations to avoid conflicts with CRUD user operations
  # Source: https://github.com/plataformatec/devise/wiki/How-To:-Manage-users-through-a-CRUD-interface
  devise_for :users, :path_prefix => "profile", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
    get 'auth/:provider', to: 'devise/sessions#create'
  end
  
  # Handles CRUD operations (but in reality only index/show) for users.
  # This line MUST be listed after 'devise_for :users'
  resources :users, only: [:index, :show] do
    # Generates 'subscribing_user_path(user_id)' and 'subscribers_user_path(user_id)'
    member do
      get :subscribing, :subscribers
    end
  end
  
  resources :articles do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  
  resources :subscriptions, only: [:create, :destroy]
  
  root 'articles#index'

end
