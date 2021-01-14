class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?
    protected
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username,:email,:password,:password_confirmation,:interest_id)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:avatar, :username,:email,:bio,:about, :interest_id ,:password,:current_password,:password_confirmation)}
    end
end
