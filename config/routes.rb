Rails.application.routes.draw do

  #Dog Routes
  get "/dogs", to: "dogs#index", as: "dogs"
  get "/dogs/:id", to: "dogs#show", as: "dog"

  #Employee Routes
  get "/employees", to: "employees#index", as: "employees"
  get "/employees/new", to: "employees#new"
  post "/employees", to: "employees#create"
  get "/employees/:id", to: "employees#show", as: "employee"
  get "/employees/:id/edit", to: "employees#edit"
  patch "/employees/:id", to: "employees#update"



  # resources :dogs
  # resources :employees

end
