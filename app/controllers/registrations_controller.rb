class RegistrationsController < Devise::RegistrationsController
    protected
    def after_sign_up_path_for(resource)
        transition_show_path  
    end
end
