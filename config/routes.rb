Rails.application.routes.draw do
  root "welcome#index"

  resources :appointments
  resources :patients do
    resources :appointments, only: [:index], controller: "patients/appointments"
  end

  get "statistics/patient_births"
end
