Rails.application.routes.draw do
  root to: 'static_pages#home'

  get '/register', to: "users#new", as: :register
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:create, :show, :edit, :update]

  namespace :user do
    resources :projects, only: :index
    resources :jobs, only: :index
  end

  resources :projects do
    member do
      get 'management'
      post 'like'
    end

    resources :jobs, except: [:index]
  end

  resources :jobs do
    resources :comments, only: [:create]
  end
end
