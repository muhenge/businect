Rails.application.routes.draw do
  get 'public/index'
  get 'public/private'
  devise_for :users
  root to: "public#index"
end
