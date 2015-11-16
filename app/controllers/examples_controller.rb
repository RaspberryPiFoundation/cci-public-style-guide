class ExamplesController < ApplicationController

  def show
    render params[:page]
  end

end
