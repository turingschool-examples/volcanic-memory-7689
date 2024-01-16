Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :labs, only: :show do # UserStory-4
    resources :scientists, only: [:show], controller: "lab/scientists" # UserStory-1+2
  end
  resources :experiments, only: [:index], controller: "experiments" #UserStory-3
  resources :scientist_experiments, only: [:destroy], controller: "scientist_experiments" #UserStory-2
end
