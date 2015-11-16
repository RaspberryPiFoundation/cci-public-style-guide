class ExamplesController < ApplicationController

  def show
    render "examples/#{params[:page]}", :layout => false
  end

end
