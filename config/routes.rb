Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/experiments", to: "experiments#index"

  resources :scientists, only: [:show] do
    resources :scientist_experiments, only: [:update]
  end

end
