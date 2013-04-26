class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
 docs_path()
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    render :text => "Access Denied"
  end
end
