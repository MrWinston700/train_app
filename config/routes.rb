Rails.application.routes.draw do
  resources :train_routes, only: [:new, :create, :edit, :index, :update]
  resources :sessions, only: [:home, :create, :new]
  get '/train_routes/save' => 'train_routes#save', :as => 'save_route'
  get '/trains/:id' => 'trains#destroy', :as => 'delete_train'
  get '/train_routes/:id' => 'train_routes#destroy',  :as => 'delete_route'
  root 'sessions#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :train_routes, only: [:index, :show, :new, :edit, :update]
  end

  resources :trains, only: [:create, :new, :edit, :update, :index] do
    resources :train_routes, only: [:index, :create, :show, :new, :edit, :update]
  end
  
  #match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
