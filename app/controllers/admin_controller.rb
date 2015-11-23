class AdminController < ApplicationController

  def index
    @sections = Section.all
  end

end
