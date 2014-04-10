Rails.application.routes.draw do

  resources :drafts do
    resources :notes
  end

  resources :notes

  resources :documents

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "application#index"


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'logout', to: 'sessions#destroy', via: [:get, :post]

end
