class Admin::SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /admin/sections
  def index
    @sections = Section.all
  end

  # GET /admin/sections/new
  def new
    @section = Section.new
  end

  # GET /admin/sections/1/edit
  def edit
  end

  # POST /admin/sections
  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to @section, notice: 'Section was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/sections/1
  def update
    if @section.update(section_params)
      redirect_to :admin_sections, notice: 'Section was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/sections/1
  def destroy
    @section.destroy
    redirect_to sections_url, notice: 'Section was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def section_params
      params.require(:section).permit(:title, :path, :order)
    end
end
