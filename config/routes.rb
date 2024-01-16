Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   get  "/scientists/:id", to: "scientists#show"
   get "/experiments/", to: "experiments#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
