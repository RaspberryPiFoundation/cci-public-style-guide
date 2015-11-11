class PagesController < ApplicationController

  def home
    @page = 'home'
  end

  def show
    @page = params[:page]
    render @page
  end

end
