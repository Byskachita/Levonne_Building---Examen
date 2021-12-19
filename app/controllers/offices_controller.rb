class OfficesController < ApplicationController
  before_action :set_office, only: %i[ show edit update destroy ]

  # GET /offices or /offices.json
  def index
    @offices = Office.includes(:building)
  end

  # GET /offices/1 or /offices/1.json
  def show
  end

  # GET /offices/new
  def new
    @office = Office.new
    set_buildings
  end

  # GET /offices/1/edit
  def edit
    set_buildings
  end

  # POST /offices or /offices.json
  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to @office, notice: "Office was successfully created." }
        format.json { render :show, status: :created, location: @office }
      else
        set_buildings
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1 or /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to @office, notice: "Office was successfully updated." }
        format.json { render :show, status: :ok, location: @office }
      else
        set_buildings
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1 or /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: "Office was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    rescue 
       flash[:set_building_error] = "Could not find the record #{params[:id]}"
       redirect_to building_path
    end

    def set_buildings
      @buildings = Building.all 
    end

    # Only allow a list of trusted parameters through.
    def office_params
      params.require(:office).permit(:number, :building_id)
    end
end
