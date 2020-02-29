Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root 'sessions#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
