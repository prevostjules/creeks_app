Rails.application.routes.draw do
  get 'creeks/new'
  get 'creeks/show'
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :creeks, only: [ :show, :new, :create, :update, :destroy ] do
    resources :tickets, only: [ :create ]
  end
end
