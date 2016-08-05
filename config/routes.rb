Rails.application.routes.draw do

  get 'signup' => 'users#new'

  resources :users, only: [:new, :create]
  resources :organizations, only: [:show]
  resources :sale, only: [:show]
end
