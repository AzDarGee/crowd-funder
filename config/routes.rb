Rails.application.routes.draw do
  root to: 'projects#index'

  # CRUD Actions - for different models
  resources :projects

  #Login and SignUp routes
  # resources :project_owners, :only => [:new,:create,:destroy]
  # resources :backers, :only => [:new,:create,:destroy]
  # resources :sessions, :only => [:new,:create,:destroy]
  resources :backers
  resources :project_owners
  resources :sessions

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "backer_signup" => "backers#new", :as => "backers_signup"
  get "project_owners_signup" => "project_owners#new", :as => "project_owners_signup"
end
