Rails.application.routes.draw do
  root "sessions#index"
  
  resources :sessions do
    resources :comments
  end
  post '/join/:id' => 'sessions#join', as: 'join'
  post '/unjoin/:id' => 'sessions#unjoin', as: 'unjoin'

  resources :spots

  resources :friendships
  get 'contact' => 'contact#index'
  get 'about' => 'contact#about'


  post 'users' => 'users#login'
  get 'logout' => 'users#logout'

  get 'sign_up', to: 'registrations#new'
  get 'profile', to: 'profile#index'
  get 'my_sessions', to: 'profile#my_sessions'
  post 'sign_up', to: 'registrations#create'
end