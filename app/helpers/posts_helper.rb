module PostsHelper
    def post_params
        params.require(:post).permit(:content, :user_id, :comment_id,:created_at)
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end
end
