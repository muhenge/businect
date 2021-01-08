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

  resources :users do
    member do
      get :following, :followers
    end
  end

  root to: "posts#index"

  resources :posts do
    member do
      put "like" => "posts#vote"
    end
    resources :users
    post 'comments', to: 'comments#create'
    # get 'users/:user_id/user_articles' => 'users#user_articles', :as => :user_articles

  end

  resources :comments

  resources :users do
    resources :posts
  end

  resources :relationships, only: [:create, :destroy]
  get 'users/:id/user_posts' => 'users#user_posts', :as => :users_posts
  
end
