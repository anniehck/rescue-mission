Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
  resources :answers, only: [:show]
  resources :users, only: :index

  # devise_for :users
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # root to: "users#new"
  # get "/auth/:provider/callback" => "sessions#create"
  # get "/signout" => "sessions#destroy", :as => :signout
end
