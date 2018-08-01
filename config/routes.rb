Rails.application.routes.draw do

  devise_for :users
  root to: 'meals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    get 'bookings/new', to: 'bookings#new'
  end
  resources :users

  get "profile", to: "pages#profile", as: "profile"
  get "host/:id", to: "pages#host", as: "host"
end
