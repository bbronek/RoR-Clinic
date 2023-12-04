Rails.application.routes.draw do
  get 'welcome/index'
  root "welcome#index"

  resources :appointments
  resources :patients do
    resources :appointments, only: [:index], controller: "patients/appointments"
  end
end
