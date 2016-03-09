Rails.application.routes.draw do
  root 'websites#index'
  get '/', to: 'websites#index'
  resources :websites, only: [:create, :index, :show]
end