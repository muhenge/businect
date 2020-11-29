Rails.application.routes.draw do
  get 'public/index'
  get 'public/private'
  devise_for :users
  root to: "public#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
