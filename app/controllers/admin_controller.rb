class AdminController < ApplicationController

  before_filter :restrict_to_development!

  def index
    render :index, :locals => { :sections => Section.all } and return
  end

  protected

  def restrict_to_development!
    not_found unless Rails.env.development?
  end

end
