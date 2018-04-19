Rails.application.routes.draw do
  get 'users/index'

  resources :inquiries
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'texts#index'
  resources :texts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
