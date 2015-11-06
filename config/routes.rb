Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :events, only: [:new, :create, :show]
end
