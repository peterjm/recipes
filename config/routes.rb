Recipes::Application.routes.draw do
  get "/login" => "sessions#new", as: 'login'
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: 'logout'

  resources :recipes
  resources :ingredients

  root to: "recipes#index"
end
