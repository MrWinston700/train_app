Rails.application.routes.draw do
  resources :train_routes, only: [:create]
  resources :trains, only: [:create, :new]
  resources :users, only: [:new, :create, :show]
  root 'sessions#home'
  resources :sessions, only [:home, :new, :create, :destroy]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
