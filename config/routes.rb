Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  root 'murals#index'
  # this will need to be changed back to 'static_pages#index' when we add react
  resources :murals, only: [:new, :create, :index, :show, :destroy] do
    resources :reviews, only: [:new, :create, :index]
  end
  resources :reviews, only: [:destroy]

  namespace :admin do
    resources :users

  end
  match 'users/:id' => 'admin/users#destroy', :via => :delete, :as => :admin_destroy_user

  # match 'murals/:id' => 'murals#delete', :via => :delete, :as => :destroy_mural

end
