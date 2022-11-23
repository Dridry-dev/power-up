Rails.application.routes.draw do
  devise_for :users
  root to: "buddies#index"
  resources :buddies, only: %i[index show edit update profil] do
    resources :prestations, only: :show do
      resources :bookings, except: :destroy
    end
  end
  resources :bookings, only: :destroy

  namespace :admin do
    resources :bookings, only: %i[index edit update]
    resources :prestations
  end
end
