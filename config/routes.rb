Rails.application.routes.draw do
  root to: 'texts#index'
  resources :texts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
