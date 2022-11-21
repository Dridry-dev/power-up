Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show edit update] do
    resources :prestations, exept: :destroy
    resources :bookings, exept: :destroy
  end
  resources :prestations, only: :destroy
  resources :bookings, only: :destroy
end
