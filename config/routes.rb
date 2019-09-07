Rails.application.routes.draw do
  devise_for :users
  root    'videos#index'
  resources :videos do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end