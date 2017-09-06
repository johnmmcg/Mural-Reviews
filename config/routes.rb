Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'murals#index'
  # this will need to be changed back to 'static_pages#index' when we add react
  resources :murals, only: [:new, :create, :index, :show]
end
