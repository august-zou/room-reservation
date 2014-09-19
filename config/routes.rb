Rails.application.routes.draw do
  get 'sessions/new', as:'login'
  resources :users, :only=>[:new,:create,:edit,:update]
  resources :sessions, :only=>[:new,:create,:destroy]
  resources :reservations
  
  namespace 'admin' do
    resources :reservations
    resources :users
    resources :rooms
  end
  root 'home#index'  
end
