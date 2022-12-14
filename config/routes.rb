Rails.application.routes.draw do
  devise_for :users
  root to: "buddies#index"
  resources :buddies, only: %i[index show edit update] do
    member do
      get :profil, as: "profil"
    end
  end
  resources :prestations, only: %i[show index] do
    resources :bookings, only: %i[index new create edit update]
    get 'user_prestations'
  end
  resources :bookings, except: %i[index new create]

  namespace :admin do
    resources :bookings, only: %i[index update]
    resources :prestations
  end

end
