Rails.application.routes.draw do
  get 'lists/index'
  devise_for :users
  root 'homes#index'
  get 'homes/index'
  resources :tasks
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
