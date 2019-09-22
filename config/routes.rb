Rails.application.routes.draw do
  devise_for :users
  root    'videos#index'
  resources :videos do
    resources :comments, only: [:update, :create]
  end
  resources :videos do
  end
  resources :users, only: [:show] do
  end

  post   '/like/:video_id', to: 'likes#like',   as: 'like'
  delete '/like/:video_id', to: 'likes#unlike', as: 'unlike'
end