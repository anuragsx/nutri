class ApplicationController < ActionController::Base
  #protect_from_forgery #with: :exception

  layout :layout_by_resource
  before_action :set_services, :configure_permitted_parameters, if: :devise_controller?
  before_action :user_profile
  
  def layout_by_resource
    if ((devise_controller? && resource_name == :user && action_name == 'new') || (request.filtered_parameters["controller"] == 'home' && request.filtered_parameters["action"] == 'about' || 'nutritionist_online' || 'services' || 'service_details' || 'contact')) 
      "devise"
    else
      "application"
    end
  end

  def user_profile
    @profile = current_user.profile.nil? ? Profile.new : current_user.profile if current_user.present?
  end 

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      #super
      dashboard_path
    else
      stored_location_for(resource) || request.referer || dashboard_path
    end
  end  

  protected

  def set_services
    @services = Service.all
  end 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
