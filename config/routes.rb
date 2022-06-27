Rails.application.routes.draw do
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "authenticate", to: "authentication#authenticate"
  post "sign_up", to: "authentication#sign_up"
end
