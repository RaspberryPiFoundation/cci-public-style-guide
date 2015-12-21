include ColorsHelper
include IconsHelper

class PagesController < ApplicationController

  before_filter :set_section_exists
  before_filter :set_page_path
  before_filter :set_page
  before_filter :set_page_partial
  before_filter :set_back_page_for_examples
  before_filter :set_page_has_view
  before_filter :set_layout
  before_filter :set_view_vars

  def show
    if @page_has_view
      return render :show, :layout => @layout
    end

    # Still here? 404.
    return not_found
  end

  private

  def set_back_page_for_examples
    if @page.is_example_page?
      @back_page = Page.find(@page.back_page_id)
    end
  end

  def set_layout
    if @page.is_example_page?
      @layout = 'examples'
    else
      @layout = 'application'
    end
  end

  def set_page
    @page    = Page.where(:path => @page_path).first || not_found
    @section = @page.section
  end

  def set_page_has_view
    @page_has_view = File.exists?(Rails.root.join("app", "views", "pages", "content", "#{@page.section.path}", "_#{@page_partial}.html.erb"))
  end

  def set_page_partial
    @page_partial = @page_path.gsub("-", "_")
  end

  def set_page_path
    @page_path = params[:page]
  end

  def set_section_exists
    Section.where(:path => params[:section]).exists? || not_found
  end

  def set_view_vars
    case @page.path
    when 'colour-palette'
      @colors = colors
    when 'icons'
      @icons = icons
    end
  end
end
