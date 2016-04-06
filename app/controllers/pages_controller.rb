include ColorsHelper
include ExamplesHelper
include IconsHelper

class PagesController < ApplicationController

  before_filter :set_section_exists
  before_filter :set_page
  before_filter :set_layout
  before_filter :set_view_vars

  def show
    if @page.has_view?
      render :show, :layout => @layout, :locals => {
        :colors       => @colors,
        :icons        => @icons,
        :page         => @page
      } and return
    end

    # Still here? 404.
    return not_found
  end

  private

  def set_layout
    if @page.is_example_page?
      @layout = 'example-page'
    else
      @layout = 'application'
    end
  end

  def set_page
    @page    = Page.where(:path => params[:page]).first || not_found
    @section = @page.section
  end

  def set_section_exists
    Section.where(:path => params[:section]).exists? || not_found
  end

  def set_view_vars
    @colors = colors
    @icons  = icons
  end
end
