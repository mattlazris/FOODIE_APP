Rails.application.routes.draw do

  devise_for :users
  resources :users
  root to: 'meals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :bookings, only: [ :index, :show, :new, :create ]
  end


  get "profile", to: "pages#profile", as: "profile"
  get "host/:id", to: "pages#host", as: "host"
end
