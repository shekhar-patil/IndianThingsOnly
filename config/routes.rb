Rails.application.routes.draw do
  root to: 'companies#home'
  resources :categories
  devise_for :users
  resources :companies

  # Ajax call for the companies provider
  get 'company_provider', to: 'companies#company_provider', as: 'data_provider'
end
