class Admin::PagesController < AdminController
  include UtilitiesHelper

  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_sections, only: [:new, :edit]

  # GET /admin/pages/new
  def new
    @page = Page.new
  end

  # GET /admin/pages/1/edit
  def edit
    render :edit, :locals => { :page => @page, :sections => @sections } and return
  end

  # POST /admin/pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to :admin_index, notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/pages/1
  def update
    if @page.update(page_params)
      redirect_to :admin_index, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/pages/1
  def destroy
    @page.destroy
    redirect_to :admin_index, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def set_sections
      @sections = Section.all
    end

    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:title, :path, :order, :section_id)
    end
end
