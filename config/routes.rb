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
  get 'status_bookings', to: 'bookings#status_bookings'

  patch 'bookings/:id/validate' => 'bookings#validate', as: :validate_booking
  patch 'bookings/:id/refuse' => 'bookings#refuse', as: :refuse_booking
end
