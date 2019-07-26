Rails.application.routes.draw do
  get   'memos'     => 'memos#index'   #メイン画面
  get   'memos/new' => 'memos#new'     #動画投稿画面
  post  'memos'     => 'memos#create'  #動画投稿機能
end