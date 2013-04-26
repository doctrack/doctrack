class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
 user_path(current_user)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    render :text => "Access Denied"
  end
end
