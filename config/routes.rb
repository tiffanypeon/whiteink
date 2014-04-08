Rails.application.routes.draw do
  resources :notes

  resources :documents

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "application#index"

end
