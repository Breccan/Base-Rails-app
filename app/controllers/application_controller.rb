# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :current_user


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  private

  def require_user
    flash[:error] = "Access Denied: User not logged in"
    redirect_to root_url unless current_user
  end

  def require_no_user
    flash[:error] = "User already logged in"
    redirect_to root_url if current_user
  end

  def redirect_back_or_default(path)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to path
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
