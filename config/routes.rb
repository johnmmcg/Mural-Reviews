Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  resources :murals, only: [:new, :create, :index, :show] do
    resources :reviews, only: [:new, :create, :index]
  end
  root 'murals#index'
=======
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'murals#index'
  # this will need to be changed back to 'static_pages#index' when we add react
  resources :murals, only: [:new, :create, :index, :show]
>>>>>>> master
end
