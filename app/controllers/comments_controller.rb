class CommentsController < ApplicationController
    include CommentsHelper
    before_action :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
        # @comment = @post.comment.new(comment_params)
        # @user = current_user
        # if @comment.save
        #     redirect_to post_path(post)
        #     flash[:notice] = 'Comments added'
        # else
        #     flash[:alert] = 'Failed'
        #     render :new
        # end
    end
end
