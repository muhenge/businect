class PostsController < ApplicationController
    include PostsHelper
    include UsersHelper
    # before_action :set_user, only: %i[show]
    before_action :set_post, only: %i[show edit update edit destroy vote]
    before_action :authenticate_user!, only: %i[new show index vote]
    before_action :current_user, only: %i[index upvote new create]

    def index
        @posts = Post.all
    end

    def show
        @comment = Comment.new
        @post_user = @post.user
        @comments = @post.comments
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)

        if @post.save
            redirect_to posts_path
            flash[:notice] = 'Posted'
        else
            flash[:alert] = 'Failed'
            render :new
        end
    end

    def edit; end

    def update
        @post.update(post_params)
        redirect_to posts_path
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to posts_path
    end

    def vote
      @post.upvote_by current_user
      redirect_back fallback_location: root_path
    end
    
end
