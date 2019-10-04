Rails.application.routes.draw do
  resources :admins
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
  root 'sessions#new'
end
