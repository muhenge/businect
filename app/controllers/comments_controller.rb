class CommentsController < ApplicationController
    include CommentsHelper
    before_action :set_post, only: %i[show edit update edit destroy]
    before_action :authenticate_user!, only: [:new]
    
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to public_index_path
            flash[:notice] = 'comment successful'
        else
            flash[:alert] = 'Not successfule'
            render :new
        end
    end
end
