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
    resources :posts
    resources :comments
  end

  root to: "posts#index"

  resources :posts do
    member do
      put "like" => "posts#vote"
    end
    resources :users
    resources :interests
    post 'comments', to: 'comments#create'
    # get 'users/:user_id/user_articles' => 'users#user_articles', :as => :user_articles

  end

  resources :comments do
    resources :users
  end

  resources :users do
    resources :posts
    resources :interests
  end
  resources :interests do
    resources :posts
    resources :users
  end
  resources :relationships, only: [:create, :destroy] do
    resources :users
  end
  get 'users/:id/user_posts' => 'users#user_posts', :as => :users_posts
  get 'users/:id/current_user_posts' => 'users#current_user_posts', :as => :current_user_posts
end
