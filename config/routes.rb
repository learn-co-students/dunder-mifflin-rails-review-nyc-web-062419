Rails.application.routes.draw do
  
  
  get '/dogs', to: "dogs#index", as: 'dogs'
  get '/dogs/:id', to: "dogs#show", as: 'dog'

  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
