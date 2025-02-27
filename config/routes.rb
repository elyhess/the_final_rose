Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bachelorettes do
    resources :contestants, controller: "bachelorette_contestants", only: [:index]
  end
  resources :contestants
  resources :outings, only: [:show]
end
