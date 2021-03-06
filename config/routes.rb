Rails.application.routes.draw do
  get 'profile', to: 'profile#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users
end
