Rails.application.routes.draw do
  get 'transition/show'
  devise_for :companies
  get 'public/index'
  get 'public/private'
  devise_for :users, controllers: { registrations: "registrations"} do
    member do
      get :following, :followers
    end
  end
  root to: "public#index"
  resources :posts
  # resources :users
end
