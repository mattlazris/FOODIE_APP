Rails.application.routes.draw do

  devise_for :users
  resources :users do
    get "follow", to: "pages#follow"
    get "unfollow", to: "pages#unfollow"
  end
  root to: 'meals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :bookings, only: [ :index, :show, :new, :create, :destroy ]
    get "favorite", to: 'pages#favorite'
    get 'unfavorite', to: 'pages#unfavorite'
    get "host", to: "pages#host"
  end


  get "profile", to: "pages#profile", as: "profile"
end
