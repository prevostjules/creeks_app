Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :pages, only: [:index]

  resources :creeks, only: [ :show, :new, :create, :update, :destroy, :edit ] do
    resources :tickets, only: [ :create ]
  end
end
