Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  # マイページを作成する
  resources :users, only: [:show]
end
