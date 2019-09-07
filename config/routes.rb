Rails.application.routes.draw do
  devise_for :users
  root    'videos#index'
  resources :videos do
    resources :comments, only: [:update, :create]
  end
  resources :users, only: [:show]
end