class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.paginate :page => params[:page], :per_page => 10
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
	flash[:success]= 'Ad was successfully created.'
        format.html { redirect_to @ad }
        format.json { render :show, status: :created, location: @ad }
      else
	flash_error
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
	flash[:success]= 'Ad was successfully updated.'
        format.html { redirect_to @ad }
        format.json { render :show, status: :ok, location: @ad }
      else
	flash_error
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      flash[:success]="Ad was sucessufully destroyed"
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  private
   def flash_error
      flash[:danger]= @ad.errors.full_messages if not @ad.nil?
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
     par = params.require(:ad).permit(:title, :budget, creatives_attributes: [:id, :bid, :adtext, :_destroy], targetings_attributes: [:id,:_destroy, :places, :gender])
     par[:creatives_attributes].each_pair{|key, creative| creative[:budget]=par[:budget]} if par[:creatives_attributes] != nil
     return par
    end
end
