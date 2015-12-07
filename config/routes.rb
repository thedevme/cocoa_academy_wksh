Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  resources :charges
  resources :purchases, only: [:show]

  root 'products#index'
end
