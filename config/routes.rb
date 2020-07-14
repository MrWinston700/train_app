Rails.application.routes.draw do
  resources :train_routes, only: [:create, :destroy, :edit]
  resources :trains, only: [:create, :new, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:home, :create, :new]
  root 'sessions#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/trains/:id' => 'trains#destroy', :as => 'delete_train'
  get '/train_routes/:id' => 'train_routes#destroy',  :as => 'delete_route'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users do
    resources :train_routes, only: [:index, :show, :new, :edit]
  end
  
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
