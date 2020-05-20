Rails.application.routes.draw do
  root to: redirect('/companies')
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
