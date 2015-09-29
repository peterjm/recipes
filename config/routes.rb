Rails.application.routes.draw do
  get "/ping" => PingController.action(:ping)

  get "/login" => "sessions#new", as: 'login'
  get '/auth/google/callback' => 'sessions#create'
  get 'auth/google/error' => 'sessions#error'
  delete "/logout" => "sessions#destroy", as: 'logout'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update]
  resources :ingredients, only: [:index, :show] do
    resource :merge, only: [:create], controller: 'ingredient_merges'
  end
  resources :sources, only: [:index, :new, :create, :show, :edit, :update]

  root to: "home#index"
end
