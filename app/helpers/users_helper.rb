module UsersHelper
    def user_params
        params.require(:user).permit(:email, :username, :avatar, :interest_id)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
