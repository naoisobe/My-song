Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/my/:id' => 'users#my', as: 'my'
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
