class CommentsController < ApplicationController
    include CommentsHelper

    before_action :set_post
    before_action :set_comment
    before_action :authenticate_user!, only: [:new]
    
    def create
        @comment = @post.comment.new(comment_params)
        @user = current_user
        if @comment.save
            redirect_to public_index_path
            flash[:notice] = 'comment successful'
        else
            flash[:alert] = 'Not successfule'
            render :new
        end
    end
end
