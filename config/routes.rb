Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]

  resources :shopping_carts, only: [:index, :show, :new, :create] do
    resources :cart_members, only: [:create]
    resources :cart_items, only: [:show, :update, :destroy]
  end

  resources :items, only: [:index, :show, :new, :create] do
    resources :cart_items, only: [:create]
  end

  resources :cart_items, only: [:update]

  # Defines the root path route ("/")
  # root "articles#index"
end
