Rails.application.routes.draw do
  get '/dogs/most_dogs', to: "dogs#most_dogs", as: 'most_dogs'
  resources :dogs
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
