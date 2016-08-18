Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:edit, :update]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :bookings
  end
  resources :bookings, only: [:index] do
  end
  get 'pending_bookings', to: 'bookings#pending_bookings'

  patch 'bookings/:id/validate' => 'bookings#validate', as: :validate_booking
end
