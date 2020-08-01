Rails.application.routes.draw do
  devise_for :users
  root 'lists#index'
  resources :lists,  only: [:new, :create, :edit, :update, :index, :destroy] do
    resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
