Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :shopping_carts, only: [:index, :show, :new, :create]

  resources :cart_members, only: [:show, :new, :create]
  # Defines the root path route ("/")
  # root "articles#index"
end
