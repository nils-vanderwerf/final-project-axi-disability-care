
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do

  get 'pages/home'
    # post "api/v1/login", to: "api/v1/sessions#create"
    # delete "api/v1/logout", to: "api/v1/sessions#logout"
    get 'api/v1/get_current_user' => 'api/v1/sessions#get_current_user'
    # post 'api/v1/registrations' => 'api/v1/users#create'
    post 'api/v1/tasks/new' => 'api/v1/tasks#create'

    devise_for :users, path_prefix: "devise", controllers: { registrations: "registrations" }, path_names: { 
      sign_in: "login", sign_out: "/logout", sign_up: "/register" 
    }



 
  
    namespace :api do
      namespace :v1 do
        # resources :bookings
        resources :categories
        resources :tasks, only: [:create, :show, :index, :destroy]
        # resources :postcodes
        resources :users, only: [:create, :show, :index] do
          resources :bookings, only: [:create, :show, :index]
        end

        devise_scope :user do
          post "login" => "sessions#create", as: "login"
          delete "logout" => "sessions#destroy", as: "logout"
          put "password/update", to: "registrations#update_password"
        end
    
        resources :sessions, only: [:create, :destroy]

        # resources :carers
        # resources :participants
        # resources :bookings
      end
    end
  
    root to: "static#home"
  end
  
