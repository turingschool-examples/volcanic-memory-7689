Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :labs do
    resources :scientists
  end

  resources :scientists do
    resources :experiments
  end
end
