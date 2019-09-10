Rails.application.routes.draw do
  devise_for :users
  root    'videos#index'
  resources :videos do
    resources :comments, only: [:update, :create]
  end
  resources :videos do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end