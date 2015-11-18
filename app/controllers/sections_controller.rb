class SectionsController < ApplicationController

  before_filter :set_section, :only => [:show]

  def show
    redirect_to pages_show_path(@section.path, @section.pages.first.path)
  end

  private

  def set_section
    @section = Section.where(:path => params[:section]).first || not_found
  end

end
