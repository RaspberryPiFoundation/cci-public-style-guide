class AdminController < ApplicationController

  before_filter :restrict_to_development!

  def index
    @sections = Section.all
  end

  protected

  def restrict_to_development!
    not_found unless Rails.env.development?
  end

end
