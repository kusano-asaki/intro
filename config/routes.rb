Rails.application.routes.draw do
  root to: 'blogs#index'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs do
    post :confirm, on: :collection
  end
end
