Rails.application.routes.draw do
  resources :train_routes
  resources :trains
  resources :users, only: [:new, :create, :show]
  root 'sessions#home'
  resources :sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
