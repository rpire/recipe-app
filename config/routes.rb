Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'
  resources :recipes, only: [:index, :new, :show, :create, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
