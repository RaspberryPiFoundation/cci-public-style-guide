class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  private

  def authenticate_user!
    Rails.logger.info('before_filter :authenticate_user!')
    # if no session
    #   redirect to login
    # end
  end

  def authenticate_admin_user!
    Rails.logger.info('before_filter :authenticate_admin_user!')

    authenticate_user!

    # if user is not admin
    #
    # end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
