class PagesController < ApplicationController

  before_filter :set_path
  before_filter :set_page

  private

  def set_page
    @page = Page.where(:path => @page_path).first || not_found
  end

  def set_path
    if params[:section].present?
      @page_path = [params[:section], params[:page]].join('/')
    else
      @page_path = params[:page]
    end
  end

end
