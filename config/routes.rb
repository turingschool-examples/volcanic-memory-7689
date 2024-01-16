Rails.application.routes.draw do

  resources :scientists, only: [:show, :update]
  resources :experiments, only: :index
end
