module CommentsHelper
    def post_params
        params.require(:comment).permit(:content, :user_id)
    end

    private

    def set_post
        @post = Comment.find(params[:id])
    end
end
