Rails.application.routes.draw do
  root to: 'companies#home'
  resources :categories
  devise_for :users
  resources :companies

  # Ajax call for the companies provider
  get 'company_provider', to: 'companies#company_provider', as: 'data_provider'
  post 'search_company', to: 'companies#search_company', as: 'search_company'
  get 'not_found', to: 'companies#not_found', as: 'not_found'
end
