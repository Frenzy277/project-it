Rails.application.routes.draw do
  root to: 'static_pages#home'

  get '/register', to: "users#new", as: :register
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users, only: [:create, :show, :edit, :update]
  resources :messages, only: [:index, :create, :destroy] do
    member do
      post 'read'
    end
  end

  namespace :user do
    resources :projects, only: :index
    resources :jobs, only: :index
  end

  resources :categories, only: [:index, :show, :new, :create]

  resources :projects do
    member do
      get 'management'
      post 'like'
    end

    resources :jobs, except: [:index, :show] do
      member do
        post 'done'
      end
    end

    resources :comments, only: [:create, :destroy]
    resources :hires, only: [:new, :create]
  end

end
