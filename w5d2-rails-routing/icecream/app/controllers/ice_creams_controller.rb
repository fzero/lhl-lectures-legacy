class IceCreamsController < ApplicationController
  before_action :set_ice_cream, only: [:show, :edit, :update, :destroy]

  # GET /ice_creams
  # GET /ice_creams.json
  def index
    @ice_creams = IceCream.all
  end

  def search
    @ice_creams = IceCream.where(flavour: params[:flavour])
    render :index
  end

  # GET /ice_creams/1
  # GET /ice_creams/1.json
  def show
  end

  # GET /ice_creams/new
  def new
    @ice_cream = IceCream.new
  end

  # GET /ice_creams/1/edit
  def edit
  end


  def enjoy
    @ice_cream = IceCream.find(params[:id])
  end

  # POST /ice_creams
  # POST /ice_creams.json
  def create
    @ice_cream = IceCream.new(ice_cream_params)

    respond_to do |format|
      if @ice_cream.save
        format.html { redirect_to @ice_cream, notice: 'Ice cream was successfully created.' }
        format.json { render :show, status: :created, location: @ice_cream }
      else
        format.html { render :new }
        format.json { render json: @ice_cream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ice_creams/1
  # PATCH/PUT /ice_creams/1.json
  def update
    respond_to do |format|
      if @ice_cream.update(ice_cream_params)
        format.html { redirect_to @ice_cream, notice: 'Ice cream was successfully updated.' }
        format.json { render :show, status: :ok, location: @ice_cream }
      else
        format.html { render :edit }
        format.json { render json: @ice_cream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ice_creams/1
  # DELETE /ice_creams/1.json
  def destroy
    @ice_cream.destroy
    respond_to do |format|
      format.html { redirect_to ice_creams_url, notice: 'Ice cream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ice_cream
      @ice_cream = IceCream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ice_cream_params
      params.require(:ice_cream).permit(:flavour, :size, :ice_cream_type, :cone)
    end
end
