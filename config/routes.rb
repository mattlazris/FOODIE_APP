Rails.application.routes.draw do

  devise_for :users
  root to: 'meals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals
  resources :users

  get "profile", to: "pages#profile", as: "profile"
end
