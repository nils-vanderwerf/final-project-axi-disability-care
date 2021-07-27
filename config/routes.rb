
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do

    post "api/v1/login", to: "api/v1/sessions#create"
    delete "api/v1/logout", to: "api/v1/sessions#logout"
    get 'api/v1/get_current_user' => 'api/v1/sessions#get_current_user'
    post 'api/v1/registrations' => 'api/v1/users#create'
    post 'api/v1/tasks/new' => 'api/v1/tasks#create'
  
    namespace :api do
      namespace :v1 do
        # resources :bookings
        resources :categories
        resources :tasks, only: [:create, :show, :index, :destroy]
        # resources :postcodes
        resources :users, only: [:create, :show, :index]
        # resources :carers
        # resources :participants
        # resources :bookings
      end
    end
  
    root to: "static#home"
  end
  
