class PostsController < ApplicationController
    include PostsHelper
    before_action :set_post, only: %i[show edit update edit destroy vote]
    before_action :authenticate_user!, only: %i[new index vote]
    before_action :current_user, only: %i[index upvote new create]

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
            flash[:alert] = 'Not successfull'
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
      redirect_back fallback_location: root_path
    end
    
end
