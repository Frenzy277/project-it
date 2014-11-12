Rails.application.routes.draw do
  root to: 'projects#index'

  get '/register', to: "users#new", as: :register
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:create]

  #resources :projects, only: [:show, :new, :create, :edit, :update]
end
