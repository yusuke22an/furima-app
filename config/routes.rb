Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :items
    get 'buy_item', to: :update, controller: 'items'
    # post 'items/new' => 'items#create'
  resources :comments
  root 'items#index'
  resources :furima
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
