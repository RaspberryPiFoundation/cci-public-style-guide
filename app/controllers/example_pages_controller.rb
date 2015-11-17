class ExamplePagesController < ApplicationController

  def show
    render params[:page]
  end

end
