module CommentsHelper
    def post_params
        params.require(:comment).permit(:text, :user_id)
    end

    private

    def set_post
        @post = Comment.find(params[:id])
    end
end
