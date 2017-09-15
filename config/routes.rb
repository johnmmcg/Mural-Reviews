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

  namespace :api do
    namespace :v1 do
      resources :murals do
        resources :reviews, :votes
      end
      # includes mural information with creator and reviews array
    end
  end

  resources :reviews, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users, only: [:destroy, :index, :show]
  end

  match 'users/:id' => 'admin/users#destroy', :via => :delete, :as => :admin_destroy_user

end
