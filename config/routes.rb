Rails.application.routes.draw do

  resources :announcements
  get 'users/index'

  resources :inquiries
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
    passwords: "users/passwords"
  }
  root 'top#index'
  resources :texts
end
