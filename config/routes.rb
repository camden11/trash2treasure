Rails.application.routes.draw do

  get 'sessions/new'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  resources :users, only: [:new, :create]
  resources :organizations, only: [:show]
  resources :sale, only: [:show]
end
