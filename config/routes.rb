Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  resources :users, only: :show
  resources :items, only: [:index, :new, :edit]
    get 'buy_item', to: :update, controller: 'items'
  resources :comments
  root 'items#index'
  resources :furima
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
