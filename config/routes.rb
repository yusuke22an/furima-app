Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :items do
    get 'buy_item', to: :update, controller: 'items'
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :comments
  root 'items#index'
  resources :furima
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
