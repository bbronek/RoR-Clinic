Rails.application.routes.draw do
  get 'appointments/index'
  get 'appointments/new'
  get 'appointments/create'
  get 'appointments/edit'
  get 'appointments/update'
  get 'appointments/destroy'
  get 'patients/index'
  get 'patients/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
