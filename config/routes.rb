Rails.application.routes.draw do
  resources :appointments
  resources :patients do
    resources :appointments, only: [:index], controller: "patients/appointments"
  end
end
