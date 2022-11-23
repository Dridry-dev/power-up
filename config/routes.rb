Rails.application.routes.draw do
  devise_for :users
  root to: "buddies#index"
  resources :buddies, only: %i[index show edit update]
  resources :prestations, only: %i[show index] do
    resources :bookings, only: %i[index new create]
  end
  resources :bookings, except: %i[index new create]

  namespace :admin do
    resources :bookings, only: %i[index edit update]
    resources :prestations
  end
end
