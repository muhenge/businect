class UsersController < ApplicationController
    include UsersHelper

    before_action :set_user, only: %i[show user_posts]
    def index
        @users = User.all
    end

    def show
    end

    def user_posts
        @user = User.find(params[:id])
        @posts = @user.posts
       #render plain: {posts: @posts.inspect, user: @user.inspect} 
    end
end
