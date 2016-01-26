class Admin::SectionsController < AdminController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /admin/sections/new
  def new
    @section = Section.new

    render :new, :locals => { :section => @section }
  end

  # GET /admin/sections/1/edit
  def edit
    render :edit, :locals => { :section => @section }
  end

  # POST /admin/sections
  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to :admin_index, notice: 'Section was successfully created.'
    else
      render :new, :locals => { :section => @section }
    end
  end

  # PATCH/PUT /admin/sections/1
  def update
    if @section.update(section_params)
      redirect_to :admin_index, notice: 'Section was successfully updated.'
    else
      render :edit, :locals => { :section => @section }
    end
  end

  # DELETE /admin/sections/1
  def destroy
    @section.destroy
    redirect_to :admin_index, notice: 'Section was successfully destroyed.'
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
