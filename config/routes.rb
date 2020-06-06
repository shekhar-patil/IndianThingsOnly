Rails.application.routes.draw do
  resources :lists
  root to: 'companies#home'
  devise_for :users
  resources :companies

  # Ajax call for the companies provider
  get 'company_provider', to: 'companies#company_provider', as: 'data_provider'
  post 'search_company', to: 'companies#search_company', as: 'search_company'
  get 'not_found', to: 'companies#not_found', as: 'not_found'
  get 'about_us', to: 'companies#about_us', as: 'about_us'
end
