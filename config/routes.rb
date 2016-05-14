Rails.application.routes.draw do
  post 'mailing_list/subscribe'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :products, only: [:index, :show]
  resources :charges
  resources :leads
  resources :purchases, only: [:show]
  # resources :products, :as => "events"

  get '/pong', to: 'pages#pong', as: 'pong'
  get '/events', to: 'products#index', as: 'products'
  get '/events/:id' , to: 'products#show', as: 'product'
  get '/subscribe', to: 'mail_list#subscribe', as: 'subscribe'

  root 'pages#landing'
  #root 'products#index'
end
