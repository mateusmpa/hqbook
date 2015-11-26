Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations"}

  devise_scope :user do
    get "/profile/:id", to: "users/registrations#show", as: 'profile'
  end

  post '/:likeable_type/:id/like', to: 'likes#create', as: 'create_like'
  get  '/:likeable_type/:id/like', to: 'likes#index', as: 'index_like'
  delete  '/:likeable_type/:id/like', to: 'likes#destroy', as: 'delete_like'

  root 'series_books#index'
  resources :series_books, only: [:show]
  resources :comic_books, only: [:show]
  resources :comments, only: [:new, :create]
end
