Rails.application.routes.draw do
  #devise_for :users
  #devise_for :admins
  root 'pages#index'
  
  # Routes for PagesController
  scope '/pages', controller: :pages do
    get 'index' => :index, as: 'index'
    get 'about' => :about
    get 'contact' => :contact
  end
  
  resources :posts
  
  # Routes for CommentsController

  scope '/comment', controller: :comments do
    # Routes for new and create actions
    post ':post_id/create' => :create, as: 'create_comment'
    delete ':id' => :destroy, as: 'comment'
  end
  
  # Devise Controllers for Admins
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  # Devise Controllers for Users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # Redirections
  # get '/stories', to: redirect('/articles')
  
  #match ... via [post, get]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
