class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?
    protected
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username,:email,:password,:passowrd_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:username,:email,:bio, :busmodel, :interest ,:about,:current_password, :interest)}
    end
end
