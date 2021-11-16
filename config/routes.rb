Rails.application.routes.draw do
  root "sessions#index"
  
  resources :sessions
  get '/join/:id' => 'sessions#join', as: 'join'

  resources :spots

  resources :friendships
  get 'contact' => 'contact#index'

  post 'users' => 'users#login'
  get 'logout' => 'users#logout'
end