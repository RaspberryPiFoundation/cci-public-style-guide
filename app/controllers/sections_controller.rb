class SectionsController < ApplicationController

  before_filter :set_section, :only => [:show]

  def show
    if @section.has_view?
      return render :show, :locals => { :section => @section }
    elsif @section.pages.any?
      return redirect_to page_path(@section.path, @section.pages.first.path)
    end

    # Still here? 404.
    not_found
  end

  private

  def set_section
    @section = Section.where(:path => params[:section]).first || not_found
  end
end
