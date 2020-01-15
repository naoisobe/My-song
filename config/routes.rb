Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root 'home#index'
  get 'home/about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
