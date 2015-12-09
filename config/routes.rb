Rails.application.routes.draw do
  # resources :products, only: [:index, :show]
  resources :charges
  resources :leads
  resources :purchases, only: [:show]
  # resources :products, :as => "events"

  get '/events', to: 'products#index', as: 'products'
  get '/events/:id' , to: 'products#show', as: 'product'

  root 'products#index'
end
