Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'card/edit'
  devise_for :users
  resources :users, only: :show
  resources :items, only: [:index, :new, :edit, :show]
    get 'buy_item', to: :update, controller: 'items'
  resources :comments
  root 'items#index'
  resources :furima
  resources :card
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
