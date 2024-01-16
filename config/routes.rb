Rails.application.routes.draw do

  resources :scientists, only: [:show, :update] do
    resources :experiments, only: [:index, :update]
  end
  
  resources :experiments, only: [:index, :update]
end
