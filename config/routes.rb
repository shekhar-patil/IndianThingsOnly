Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: redirect('/companies')
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'company_provider', to: 'companies#company_provider', as: 'data_provider'
end
