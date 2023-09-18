Rails.application.routes.draw do

  devise_for :users
  root to: "home#top"
  resources :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :update]
  get "/home/about" => 'home#about'
end