Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :memos #, except: [:index]
  resource :friendships, only: [:create, :destroy]

  root 'memos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
