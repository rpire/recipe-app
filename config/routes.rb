Rails.application.routes.draw do
  root 'public_recipes#index'
  resources :recipes, only: [:index, :new, :show, :create]
  resources :foods, only: [:index, :new, :create]
  resources :public_recipes, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
