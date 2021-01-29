Rails.application.routes.draw do
  resources :cars
  resources :rents

  devise_for :users
  resources :users, only: [:show, :edit, :update]

  root 'cars#index'
end
