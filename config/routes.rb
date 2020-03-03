Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
  devise_for :users
  resources :users, only: :show
  resources :items, only: [:index, :new, :edit]
    get 'buy_item', to: :update, controller: 'items'
  resources :comments
  root 'items#index'
  resources :furima

  resources :card, only: [:new, :show, :delete] do
    collection do
      post 'pay', to: 'card#pay'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
