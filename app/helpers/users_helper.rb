module UsersHelper
    def user_params
        params.require(:user).permit(:email, :username, :avatar, :interest_id)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def username_error(user)
        flash[:notice] = "Please enter your username" if user.errors.messages[:username] === ["can't be blank"]
    end

    def email_error(user)
        flash[:notice] = "Please enter your email" if user.errors.messages[:email] === ["can't be blank"]
    end

    def interest_error(user)
        flash[:notice] = "Please select your interest" if user.errors.messages[:interest] === ["must exist"]
    end

    def password_error(user)
        flash[:notice] = "Please create a password" if user.errors.messages[:password] === ["can't be blank"]
    end
end
