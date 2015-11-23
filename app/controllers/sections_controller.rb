class SectionsController < ApplicationController

  before_filter :set_section_path,     :only => [:show]
  before_filter :set_section,          :only => [:show]
  before_filter :set_section_has_view, :only => [:show]

  def show
    if @section_has_view
      return render :show
    elsif @section.pages.any?
      return redirect_to page_path(@section.path, @section.pages.first.path)
    end

    # Still here? 404.
    not_found
  end

  private

  def set_section
    @section = Section.where(:path => @section_path).first || not_found
  end

  def set_section_path
    @section_path = params[:section]
  end

  def set_section_has_view
    @section_has_view = File.exists?(Rails.root.join("app", "views", "sections", "content", "_#{@section_path}.html.erb"))
  end

end
