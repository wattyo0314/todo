Rails.application.routes.draw do
  get 'lists/index'
  devise_for :users
  root 'lists#index'
  get 'homes/index'
  resources :lists,  only: [:new, :create, :edit, :update, :index, :destroy] do
    resources :tasks
    
  end
  resources :homes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
