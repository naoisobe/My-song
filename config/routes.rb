Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  devise_for :instructors, controllers: {
    sessions:      'instructors/sessions',
    passwords:     'instructors/passwords',
    registrations: 'instructors/registrations'
  }
  resources :instructor, only: %i[show edit update destroy]
  resources :practices
  get 'training/my_list'
  devise_for :users
  resources :users, only: %i[index show edit update]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :songs
  get 'songs/my_list/:id' => 'songs#my_list', as: 'my_list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
