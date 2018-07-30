Rails.application.routes.draw do
  get 'meal/index'
  get 'meal/show'
  get 'meal/new'
  get 'meal/create'
  get 'meal/edit'
  get 'meal/update'
  get 'meal/destroy'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meals
end
