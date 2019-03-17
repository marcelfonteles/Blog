Rails.application.routes.draw do
  #devise_for :users
  #devise_for :admins
  root 'pages#index'
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  
  resources :posts
  
  resources :comments, except: [:edit, :create, :new, :update]
  get '/comment/:id/new', to: 'comments#new', as: 'new_comment'
  post '/comment/:post_id/create', to: 'comments#create', as: 'create_comment'
  
  get '/comment/:post_id/:comment_id/edit', to: 'comments#edit', as: 'edit_comment'
  patch 'comment/:post_id/:comment_id/update', to: 'comments#update', as: 'update_comment'
  
  # Devise Controllers for Admins
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  # Devise Controllers for Users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
