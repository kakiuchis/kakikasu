Rails.application.routes.draw do

  resources :announcements
  get 'users/index'

  resources :inquiries
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'top#index'
  resources :texts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
