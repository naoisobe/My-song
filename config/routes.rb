Rails.application.routes.draw do
  get 'songs/index'
  get 'songs/show'
  get 'songs/edit'
  root 'home#index'
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
