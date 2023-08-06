module Users
  class RegistrationsController < Devise::RegistrationsController
    
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    
    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :phone, :address, :active])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :phone, :address, :active])
    end

    def configure_show_params
      devise_parameter_sanitizer.permit(:show, keys: [:name, :role, :phone, :address, :active])
    end
  end
end
