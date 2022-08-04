Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :tasks 
  resources :histories
  get "/tasks/:id/histories" => "histories#show"
  delete "tasks/:id/histories" => "histories#destroy"

end
