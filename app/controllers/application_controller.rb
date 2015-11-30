include AuthHelper

class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_admin_user!
    Rails.logger.info('before_filter :authenticate_admin_user!')

    if !user_is_authenticated?
      redirect_to :admin_login
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
