Rails.application.routes.draw do
  root "sessions#index"
  
  resources :sessions
  post '/join/:id' => 'sessions#join', as: 'join'
  post '/unjoin/:id' => 'sessions#unjoin', as: 'unjoin'

  resources :spots

  resources :friendships
  get 'contact' => 'contact#index'
  get 'about' => 'contact#about'


  post 'users' => 'users#login'
  get 'logout' => 'users#logout'
end