Rails.application.routes.draw do
  resources :products
  resources :charges
  resources :purchases, only: [:show]

  root 'pages#home'
end
