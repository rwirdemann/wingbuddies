Rails.application.routes.draw do
  root "sessions#index"
  
  get "/sessions", to: "sessions#index"
end