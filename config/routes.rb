Rails.application.routes.draw do
  get 'projects/new' => 'projects#new', as: :new_project
  get 'projects/:id' => 'projects#show', as: :project
  post 'projects' => 'projects#create', as: :projects

  get '/login',  to: 'sessions#new',     as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post '/auth/failure',             to: 'sessions#failure'

  match '/:user/:repo', to: 'projects#show', via: [:get], as: :project_direct

  root 'projects#index'
end
