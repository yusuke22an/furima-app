Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items, only: :index
  resources :comments
  

  root 'items#index'

  # resources :furima

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
