class TargetingsController < ApplicationController
  before_action :set_targeting, only: [:show, :edit, :update, :destroy]

  # GET /targetings
  # GET /targetings.json
  def index
    @targetings = Targeting.all
  end

  # GET /targetings/1
  # GET /targetings/1.json
  def show
  end

  # GET /targetings/new
  def new
    @targeting = Targeting.new
    @targeting.ad_id = params[:ad_id]
  end

  # GET /targetings/1/edit
  def edit
  end

  # POST /targetings
  # POST /targetings.json
  def create
    @targeting = Targeting.new(targeting_params)

    respond_to do |format|
      if @targeting.save
        format.html { redirect_to ad_targeting_path(@targeting.ad, @targeting), notice: 'Targeting was successfully created.' }
        format.json { render :show, status: :created, location: @targeting }
      else
        format.html { render :new }
        format.json { render json: @targeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /targetings/1
  # PATCH/PUT /targetings/1.json
  def update
    respond_to do |format|
      if @targeting.update(targeting_params)
        format.html { redirect_to ad_targeting_path(@targeting.ad, @targeting), notice: 'Targeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @targeting }
      else
        format.html { render :edit }
        format.json { render json: @targeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /targetings/1
  # DELETE /targetings/1.json
  def destroy
    @targeting.destroy
    respond_to do |format|
      format.html { redirect_to ad_targetings_url, notice: 'Targeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_targeting
      @targeting = Targeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def targeting_params
      params.require(:targeting).permit(:places, :gender, :ad_id)
    end
end
