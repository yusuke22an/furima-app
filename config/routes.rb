Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users, only: :show
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    get 'buy_item', to: :update, controller: 'items'
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
  resources :items, only: [:edit, :update] do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
  end
  resources :comments
  root 'items#index'

  resources :card, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'card#pay'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
