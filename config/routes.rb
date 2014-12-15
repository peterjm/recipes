Rails.application.routes.draw do
  get "/login" => "sessions#new", as: 'login'
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: 'logout'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update]
  resources :ingredients, only: [:index, :show] do
    resource :merge, only: [:create], controller: 'ingredient_merges'
  end

  root to: "recipes#index"
end
