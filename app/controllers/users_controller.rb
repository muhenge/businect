class UsersController < ApplicationController
    include UsersHelper
    before_action :set_user, only: %i[show user_posts]
    before_action :authenticate_user!
    def index
        @users = User.search[params[:search]]
    end

    def show; end

    def user_posts
        @posts = @user.posts
    end

    def current_user_posts
        @current_posts = current_user.posts
    end

    def edit
        @user_name = User.find(1)
    end
    

    def following
        @title = "Following"
        @user = User.find(params[:id])
        render 'following'
    end

    def followers
        @title = "Followers"
        @user = User.find(params[:id])
        render 'followers'
    end
end
