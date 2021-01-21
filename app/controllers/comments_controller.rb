class CommentsController < ApplicationController
    include CommentsHelper
    before_action :authenticate_user!
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
            redirect_to post_path(@post)
            flash[:notice] = 'Comments added'
        else
            redirect_to post_path(@post)
            flash[:alert] = 'No comment added'
        end
  
    end
end
