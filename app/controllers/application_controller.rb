class ApplicationController < ActionController::Base
    # include ApplicationHelper
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
    
  def counts(bicycle) 
    @count_bicyles = @user.bicycles.count
  end

  
end
