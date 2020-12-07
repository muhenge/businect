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
  resources :posts do
    member do
      put "like" => "posts#vote"
    end
    
  end
  resources :comments
  resources :users do
    resources :posts, only: [:index]
  end
  get 'users/:id/user_posts' => 'users#user_posts', :as => :users_posts
end
