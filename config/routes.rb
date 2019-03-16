Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  
  resources :posts
  resources :comments, except: [:create, :new]
  get '/comment/:id/new', to: 'comments#new', as: 'new_comment'
  post '/comment/:id/create', to: 'comments#create', as: 'create_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
