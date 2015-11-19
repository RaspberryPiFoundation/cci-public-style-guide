class PagesController < ApplicationController

  before_filter :set_section_exists, :only => [:show]
  before_filter :set_page_path,      :only => [:show]
  before_filter :set_page,           :only => [:show]
  before_filter :set_page_has_view,  :only => [:show]
  before_filter :set_layout,         :only => [:show]

  def show
    if @page_has_view
      return render :show, :layout => @layout
    end

    # Still here? 404.
    return not_found
  end

  private

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
    @page_has_view = File.exists?(Rails.root.join("app", "views", "pages", "content", "#{@page.section.path}", "_#{@page_path}.html.erb"))
  end

  def set_page_path
    @page_path = params[:page]
  end

  def set_section_exists
    Section.where(:path => params[:section]).exists? || not_found
  end

end
