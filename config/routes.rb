Rails.application.routes.draw do
  root to: 'projects#index'

  devise_for :users
  resources :projects, only: [:index, :new, :create, :show]
end
