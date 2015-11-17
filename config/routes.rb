Rails.application.routes.draw do
  devise_for :users
  root 'series_books#index'
  resources :series_books, only: [:show] do
    resources :comic_books, only: [:show]
  end
end
