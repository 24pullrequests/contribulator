Rails.application.routes.draw do
  root 'projects#index'
  get 'products/:id' => 'projects#show', as: :project
end
