Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # get 'login', to: 'pages#log_in_sign_up'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boats do
  	resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:update]
  patch 'update_canceled/:id', to: 'bookings#update_destroy', as: 'update_destroy'
end
