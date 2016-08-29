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
  resources :shoppers, only: [:show]
  resources :shopper_items, only: [:create, :update, :destroy]
end
