Rails.application.routes.draw do
  root 'projects#index'
  get 'projects/:id' => 'projects#show', as: :project

  get '/login',  to: 'sessions#new',     as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post '/auth/failure',             to: 'sessions#failure'
end
