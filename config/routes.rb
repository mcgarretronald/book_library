Rails.application.routes.draw do
  # Routes for books
  resources :books, only: [ :index ] do
    post "borrow", on: :member
  end

  # Route to return a borrowed book
  post "return_book/:id", to: "books#return_book", as: "return_book"

  # User profile page
  get "profile", to: "users#show", as: :user_profile

  # For handling user authentication
  devise_for :users

  # Set the root route
  root "books#index"
end
