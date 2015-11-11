Rails.application.routes.draw do
  root 'users#index'
  delete 'uninvite' => 'invitations#destroy'

  resources :users, only: [:create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:index, :new, :create, :show]
  resources :invitations, only: [:create]
end
