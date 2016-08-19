Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:edit, :update]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trucks do
    resources :bookings
  end
  get    "my_trucks",      to: "trucks#my_trucks"
  resources :bookings, only: [:index] do
  end
  get 'status_bookings', to: 'bookings#status_bookings'

  patch 'bookings/:id/validate' => 'bookings#validate', as: :validate_booking
end
