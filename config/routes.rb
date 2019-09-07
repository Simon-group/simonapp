Rails.application.routes.draw do
  devise_for :users
  root    'videos#index'
  resources :videos
  resources :users, only: [:show]
end