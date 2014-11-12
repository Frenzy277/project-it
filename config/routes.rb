Rails.application.routes.draw do
  root to: 'projects#index'

  get '/register', to: "users#new", as: :register
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:create, :show, :edit, :update]
  resources :projects, only: [:new, :create, :show, :edit, :update, :destroy]
end
