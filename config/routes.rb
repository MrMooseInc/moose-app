Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :tasks 
  resources :histories
  get "/tasks/:id/histories" => "histories#show"
  get "tasks/:id/add_dose" => "tasks#add_dose"
  delete "tasks/:id/remove_dose" => "tasks#remove_dose"
end
