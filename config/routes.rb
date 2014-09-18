Rails.application.routes.draw do
  get 'sessions/new', as:'login'
  resources :users
  resources :sessions
  resources :reservations
  root 'home#index'  
end
