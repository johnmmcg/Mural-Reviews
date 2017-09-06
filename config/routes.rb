Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root 'murals#index'
  # this will need to be changed back to 'static_pages#index' when we add react
  resources :murals, only: [:new, :create, :index, :show]
end
