Rails.application.routes.draw do
  devise_for :users
  resources :memos #, except: [:index]

  root 'memos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
