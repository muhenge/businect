class UsersController < ApplicationController
    include UsersHelper
    before_action :set_user, only: %i[show user_posts]
    before_action :authenticate_user!, only: %i[show edit following followers user_posts]
    def index
        @users = User.all
    end

    def show; end

    def user_posts
        @user = User.find(params[:id])
        @posts = @user.posts
        @post = Post.find(params[:id])
       #render plain: {posts: @posts.inspect, user: @user.inspect}
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
