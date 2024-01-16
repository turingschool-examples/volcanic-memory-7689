Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :labs, only: [] do
    resources :scientists, controller: 'lab_scientists', only: [:show] do
      resources :experiments, only: [:destroy] do
      end
    end
  end
end
