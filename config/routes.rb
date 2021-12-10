Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :users, only: :show
end
