class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
        
    protected 

    def configure_permitted_parameters               
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:cover_image, :profile_image, :email, :password, :password_confirmation, :current_password) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:cover_image, :profile_image, :email, :password, :password_confirmation, :current_password) }
    end
end
