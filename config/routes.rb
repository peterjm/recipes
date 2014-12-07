Rails.application.routes.draw do
  get "/login" => "sessions#new", as: 'login'
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: 'logout'

  resources :recipes
  resources :ingredients do
    resource :merge, only: [:create], controller: 'ingredient_merges'
  end

  root to: "recipes#index"
end
