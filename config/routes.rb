Rails.application.routes.draw do
  root "sessions#index"
  
  resources :sessions

  post 'users' => 'users#login'
  get 'logout' => 'users#logout'
end