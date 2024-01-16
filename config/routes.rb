Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :labs, only: :show do # UserStory-4
    resources :scientists, only: [:show], controller: "lab/scientists" # UserStory-1
  end
end
