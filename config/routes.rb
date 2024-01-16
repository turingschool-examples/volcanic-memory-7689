Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :scientists, only: [:show, :destroy]
  resources :experiments, only: [:index]

  delete "/scientist_experiments", to: "scientist_experiments#destroy"
  # resources :scientist_experiments, only: [:destroy]
end
