Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects

  #Login and SignUp routes
  resources :project_owners, :only => [:new,:create,:destroy]
  resources :backers, :only => [:new,:create,:destroy]
  resources :sessions, :only => [:new,:create,:destroy]
end
