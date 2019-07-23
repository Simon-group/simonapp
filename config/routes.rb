Rails.application.routes.draw do
  root 'memos#index'
  get 'memos' => 'memos#index'
end
