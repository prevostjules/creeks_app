Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/team", to: "pages#team", as: "team"

  resources :users, only: [:show]
  resources :pages, only: [:index]
  resources :contacts, only: [:new, :create]
  resources :categories, only: [:index]

  resources :creeks, only: [ :show, :new, :create, :update, :destroy, :edit ] do
    resources :tickets, only: [ :create ]
    resources :messages, only: [ :create ]
  end
end
