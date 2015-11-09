Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :events, only: [:index, :new, :create, :show]
end
