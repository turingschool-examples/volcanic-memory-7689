Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :scientists, only: [:show, :destroy] do
    resources :scientist_experiments, controller: 'scientist_experiments'
  end

  delete "/scientist_experiments", to: "scientist_experiments#destroy"
end
