Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
  root 'tasks#index'
  namespace :admin do
    resources :users
  end
end
