Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
devise_for :instructors, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  resources :users, only: %i[index show edit update]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :songs
  get 'songs/my_list/:id' => 'songs#my_list', as: 'my_list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
