Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :scientists, only: [:show] do
    resources :experiments, only: [:destroy]
    # Implementing this was a stinker. Wanted to follow RESTful routing as much as possible.
    # Didn't make sense to make it the scientist delete route in the event that deleting a
    # scientist needed to be implemented later. 
  end
end
