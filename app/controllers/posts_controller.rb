class PostsController < ApplicationController
    include PostsHelper
    before_action :set_post, only: %i[show edit]
    before_action :authenticate_user!, only: [:new]
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
        
    end

    def destroy
    end
    
end
