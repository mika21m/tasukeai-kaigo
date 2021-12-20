Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, only: :show
  resources :posts do
    resources :comments, only: :create
  end

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  post 'good/:id' => 'goods#create', as: 'create_good'
 delete 'good/:id' => 'goods#destroy', as: 'destroy_good'
end
