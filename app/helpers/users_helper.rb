module UsersHelper
    def user_params
        params.require(:user).permit(:username, :email)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
