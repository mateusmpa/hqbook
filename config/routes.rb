Rails.application.routes.draw do
  root 'series_books#index'
  resources :series_books, only: [:show, :new, :create] do
    resources :comic_books, only: [:show]
  end
end
