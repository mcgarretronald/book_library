Rails.application.routes.draw do
  devise_for :users
  resources :books do
    member do
      post :borrow
    end
  end
  get "profile", to: "users#profile"
  root "books#index"
end
