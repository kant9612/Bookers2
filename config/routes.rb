Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about' =>'homes#about'
  # マイページを作成する
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
end
