Rails.application.routes.draw do

  root 'website_pages#home'

  get 'sessions/new'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'

  resources :users, only: [:index, :new, :create]
  resources :organizations, only: [:show]
  resources :sales, only: [:show, :new, :create]
  resources :items, only: [:index, :create, :import] do
    collection { post :import }
  end

  get 'shoppers/search' => "shoppers#search", as: :search_shopper
  get 'shoppers/:id/checkout' => "shoppers#checkout", as: :checkout_shopper
  put 'shoppers/:id/confirm_checkout' => "shoppers#confirm_checkout", as: :confirm_shopper_checkout
  resources :shoppers, only: [:index, :show, :update, :create]
  
  resources :shopper_items, only: [:create, :update, :destroy]
  resources :extra_charges, only: [:create, :destroy]
end
