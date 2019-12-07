  Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  get 'main/index', to: "main#index"
  get 'main/mypage', to: "main#mypage"
  get 'charge', to: "main#charge"
  resources :image_items
  resources :reviews
end
