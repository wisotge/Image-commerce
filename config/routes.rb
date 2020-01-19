Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'main#index'
  get 'main/index', to: "main#index"
  get 'main/charge'
  get 'main/paymodule'
  put 'main/chocomush', to: "main#addBalance"
  get '/cart', to: "main#cart"

  resources :image_items do
    member do
      put :add_video
    end
  end

  resources :users do 
    member do
      put :add_balance
      get :mypage
    end 
  end 
  resources :reviews, only: [:create, :destroy]
  resources :orders
  resources :user_items, only: [:create, :destroy]
end
