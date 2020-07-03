Rails.application.routes.draw do
  resources :train_routes, only: [:create, :destroy, :edit]
  resources :trains, only: [:create, :new, :edit]
  resources :users, only: [:new, :create, :show, :edit, :update]
  root 'sessions#home'
  resources :sessions, only: [:home, :new, :create, :destroy]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/train_routes/:id' => 'train_routes#destroy',  :as => 'delete_route'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
