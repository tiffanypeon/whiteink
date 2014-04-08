Rails.application.routes.draw do
  get 'drafts/new'

  get 'drafts/create'

  get 'drafts/edit'

  get 'drafts/destroy'

  get 'drafts/index'

  get 'drafts/update'

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
