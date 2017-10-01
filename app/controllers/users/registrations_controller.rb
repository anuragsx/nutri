class Users::RegistrationsController < Devise::RegistrationsController
 before_action :configure_sign_up_params, only: [:create]
 before_action :configure_account_update_params, only: [:update]
 layout 'register'

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def create
    
    sign_up_params.update(role_id: 3)
      a = build_resource(sign_up_params)
      if resource.save
        if resource.active_for_authentication?     
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_in(resource_name, resource)
          UserMailer.welcome_email(resource).deliver_later
          UserMailer.new_user_registration_email(resource).deliver_later
          respond_with resource, :location => (redirect_to(dashboard_path) and return)
        else
          set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
          expire_session_data_after_sign_in!
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      else
        #clean_up_passwords(resource)

        # Solution for displaying Devise errors on the homepage found on:
        # http://stackoverflow.com/questions/4101641/rails-devise-handling-devise-error-messages
        #flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages
        #set_flash_message :notice, :inactive_signed_up if is_navigational_format?
         resource.errors.full_messages.each {|x| flash[x] = x}
        redirect_to new_user_registration_path # HERE IS THE PATH YOU WANT TO CHANGE
      end
    end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name , :last_name, :phone_no, :role_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name , :last_name, :phone_no, :role_id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
