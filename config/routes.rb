Rails.application.routes.draw do
  get "/login" => "sessions#new", as: 'login'
  get '/auth/google/callback' => 'sessions#create'
  get 'auth/google/error' => 'sessions#error'
  delete "/logout" => "sessions#destroy", as: 'logout'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update]
  resources :ingredients, only: [:index, :show] do
    resource :merge, only: [:create], controller: 'ingredient_merges'
  end
  resources :sources, only: [:index, :show, :edit, :update]

  root to: "recipes#index"
end
