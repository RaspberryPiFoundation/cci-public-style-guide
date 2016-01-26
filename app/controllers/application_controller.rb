class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end
