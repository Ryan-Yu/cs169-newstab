Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories

  resources :groups
  post 'groups/subscribe/:id', to: 'groups#subscribe'
  post 'groups/unsubscribe/:id', to: 'groups#unsubscribe'
  post 'groups/invite/:id', to: 'groups#invite'
  resources :articles
  resources :categories
  
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
    
    collection do
      get :search_for
    end
  end
  
  resources :articles do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  
  resources :subscriptions, only: [:create, :destroy]
  
  root 'articles#index'

end
