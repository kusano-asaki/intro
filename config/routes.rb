Rails.application.routes.draw do
  root to: 'blogs#index'

  resources :blogs do
    post :confirm, on: :collection
  end
end
