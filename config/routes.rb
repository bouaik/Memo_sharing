Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  resources :memos
  resource :friendships, only: [:create, :destroy]

  root 'memos#index'
end
