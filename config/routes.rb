Rails.application.routes.draw do
  devise_for :companies
  get 'public/index'
  get 'public/private'
  devise_for :users
  root to: "public#index"
end
