Rails.application.routes.draw do
  root to: 'projects#index'

  # CRUD Actions
  resources :projects do
    resources :breakpoints, :only => [:create,:destroy,:update,:show]
    resources :comments, :only => [:create,:update,:show]
  end


  # Login and SignUp routes
  resources :project_owners, :only => [:new,:create,:destroy,:edit,:update,:show]
  resources :backers, :only => [:new,:create,:destroy]
  resources :sessions, :only => [:new,:create,:destroy]

  # Custom paths for login/logout/signups
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "backer_signup" => "backers#new", :as => "backers_signup"
  get "project_owners_signup" => "project_owners#new", :as => "project_owners_signup"

  # Tagging projects


  # Comments
  resources :comments, :only => [:destroy]

end
