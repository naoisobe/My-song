Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  get 'likes/my_list/:id' => 'likes#my_list', as: 'like_my_list'
  get 'instructor/ms_list/:id' => 'instructor#ms_list', as: 'ms_list'
  devise_for :instructors, controllers: {
    sessions: 'instructors/sessions',
    passwords: 'instructors/passwords',
    registrations: 'instructors/registrations'
  }
  resources :instructor, only: %i[show edit update destroy]
  resources :practices
  resources :advise_chat, only: %i[create destroy]
  get 'practices/my_list/:id' => 'practices#my_list', as: 'practice_my_list'
  devise_for :users
  resources :users, only: %i[index show edit update]
  resources :comments, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  get 'follows/:id' => 'relationships#follows', as: 'follows'
  get 'followers/:id' => 'relationships#followers', as: 'followers'
  get 'songs/search' => 'songs#search', as: 'songs_search'
  get 'songs/my_list/:id' => 'songs#my_list', as: 'song_my_list'
  get 'songs/rank' => 'songs#rank'
  resources :songs do
    resource :likes, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
