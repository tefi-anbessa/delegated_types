class CablesController < ApplicationController
  before_action :set_cable, only: %i[ show edit update destroy ]

  # GET /cables or /cables.json
  def index
    @cables = Cable.all
  end

  # GET /cables/1 or /cables/1.json
  def show
  end

  # GET /cables/new
  def new
    @cable = Cable.new
    @cable.build_tag
  end

  # GET /cables/1/edit
  def edit
  end

  # POST /cables or /cables.json
  def create
    @cable = Cable.new(cable_params)

    respond_to do |format|
      if @cable.save
        format.html { redirect_to @cable, notice: "Cable was successfully created." }
        format.json { render :show, status: :created, location: @cable }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cables/1 or /cables/1.json
  def update
    respond_to do |format|
      if @cable.update(cable_params)
        format.html { redirect_to @cable, notice: "Cable was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @cable }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cables/1 or /cables/1.json
  def destroy
    @cable.destroy!

    respond_to do |format|
      format.html { redirect_to cables_path, notice: "Cable was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cable
      @cable = Cable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cable_params
      params.expect(cable: [:length, :cable_type_id, 
                          tag_attributes: [:label, :service]])
    end
end
