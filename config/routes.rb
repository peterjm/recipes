Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/ping" => PingController.action(:ping)

  get "/login" => "sessions#new", as: 'login'
  get '/auth/google/callback' => 'sessions#create'
  get 'auth/google/error' => 'sessions#error'
  delete "/logout" => "sessions#destroy", as: 'logout'

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update] do
    resource :flag, only: [:create, :destroy], controller: 'recipe_flags'
  end

  resources :ingredients, only: [:index, :show] do
    resource :merge, only: [:create], controller: 'ingredient_merges'
  end
  resources :sources, only: [:index, :new, :create, :show, :edit, :update]

  get '/search' => 'search#index', as: 'search'

  root to: "home#index"
end
