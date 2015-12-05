Rails.application.routes.draw do
  resources :products
  resources :charges
  
  root 'pages#home'
end
