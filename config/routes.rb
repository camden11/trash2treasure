Rails.application.routes.draw do

  root 'sessions#new'

  get 'sessions/new'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :organizations, only: [:show]
  resources :sale, only: [:show]
end
