module CommentsHelper
    def comment_params
        params.require(:comment).permit(:text, :user_id, :post_id)
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end
end
