class AdminController < ApplicationController

  before_filter :authenticate_admin_user!, :except => [:login]

  def index
    @sections = Section.all
  end

  def login
    if user_is_authenticated?
      redirect_to :admin_index
    end
  end

end
