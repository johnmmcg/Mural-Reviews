Rails.application.routes.draw do
  devise_for :users
  resources :murals, only: [:new, :create, :index, :show] do
    resources :reviews, only: [:new, :create, :index]
  end
  root 'murals#index'
end
