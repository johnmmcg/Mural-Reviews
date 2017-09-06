Rails.application.routes.draw do
  devise_for :users
  resources :murals, only: [:new, :create, :index, :show]
  root 'static_pages#index'
end
