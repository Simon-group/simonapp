Rails.application.routes.draw do
  devise_for :users
  root    'memos#index'
  get     'memos'     => 'memos#index'         #メイン画面
  get     'memos/new' => 'memos#new'           #動画投稿画面
  post    'memos'     => 'memos#create'        #動画投稿機能
  delete  'memos/:id' => 'memos#destroy'       #投稿削除機能
  patch   'memos/:id' => 'memos#update'        #投稿編集の更新
  get     'memos/:id/edit'  =>  'memos#edit'   #投稿編集機能
  get     'memos/:id' =>  'memos#show'         #動画詳細画面
end