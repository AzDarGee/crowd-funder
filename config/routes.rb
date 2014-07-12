Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects
  resources :project_owners, :only => [:new,:create,:destroy]
  resources :backers, :only => [:new,:create,:destroy]

end
