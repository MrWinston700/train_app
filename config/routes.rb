Rails.application.routes.draw do
  resources :train_routes, only: [:new, :create, :destroy, :edit, :index, :update]
  resources :trains, only: [:create, :new, :edit, :update, :destroy, :index]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:home, :create, :new]
  root 'sessions#home'
  get '/train_routes/save' => 'train_routes#save', :as => 'save_route'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/trains/:id' => 'trains#destroy', :as => 'delete_train'
  get '/train_routes/:id' => 'train_routes#destroy',  :as => 'delete_route'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users do
    resources :train_routes, only: [:index, :show, :new, :edit, :update]
  end

  resources :trains do
    resources :train_routes, only: [:index, :create, :show, :new, :edit, :update]
  end
  
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
