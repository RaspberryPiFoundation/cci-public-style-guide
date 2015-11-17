class PagesController < ApplicationController

  def home
    #@page = Page.find('foo', 'bar')
    @page = 'home'
  end

  def show
    @section = params[:section]
    @page    = params[:page]

    render "pages/#{@section}/#{@page}"
  end

end
