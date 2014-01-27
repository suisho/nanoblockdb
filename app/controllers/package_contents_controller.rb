class PackageContentsController < ApplicationController
  before_action :set_package_content, only: [:show, :edit, :update, :destroy]

  # GET /package_contents
  # GET /package_contents.json
  def index
    @package_contents = PackageContent.all
  end

  # GET /package_contents/1
  # GET /package_contents/1.json
  def show
  end

  # GET /package_contents/new
  def new
    @package_content = PackageContent.new
  end

  # GET /package_contents/1/edit
  def edit
  end

  # POST /package_contents
  # POST /package_contents.json
  def create
    @package_content = PackageContent.new(package_content_params)

    respond_to do |format|
      if @package_content.save
        format.html { redirect_to @package_content, notice: 'Package content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @package_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @package_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_contents/1
  # PATCH/PUT /package_contents/1.json
  def update
    respond_to do |format|
      if @package_content.update(package_content_params)
        format.html { redirect_to @package_content, notice: 'Package content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @package_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_contents/1
  # DELETE /package_contents/1.json
  def destroy
    @package_content.destroy
    respond_to do |format|
      format.html { redirect_to package_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_content
      @package_content = PackageContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_content_params
      params.require(:package_content).permit(:package_id, :color_id, :shape_id, :count)
    end
end
