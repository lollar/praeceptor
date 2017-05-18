Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create]
end
