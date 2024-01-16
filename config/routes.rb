Rails.application.routes.draw do

  resources :scientists, only: :show
end
