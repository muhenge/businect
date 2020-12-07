class PostsController < ApplicationController
    include PostsHelper
    include UsersHelper
    before_action :set_post, only: %i[show edit update edit destroy vote]
    before_action :authenticate_user!, only: %i[new index vote]
    # before_action :set_user, only: %i[index]
    def index
        @posts = Post.all
    end

    def show; end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to public_index_path
            flash[:notice] = 'Post successful'
        else
            flash[:alert] = 'Not successfule'
            render :new
        end
    end

    def edit; end

    def update
        @post.update(post_params)
        redirect_to public_index_path
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to public_index_path
    end

    def vote
      @post.upvote_by current_user
      redirect_to article_path(@article)
    end
    
end
