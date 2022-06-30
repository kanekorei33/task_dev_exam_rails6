class RentHousesController < ApplicationController
  before_action :set_rent_house, only: %i[ show edit update destroy ]

  # GET /rent_houses or /rent_houses.json
  def index
    @rent_houses = RentHouse.all
  end

  # GET /rent_houses/1 or /rent_houses/1.json
  def show
    @stations = @rent_house.stations
  end

  # GET /rent_houses/new
  def new
    @rent_house = RentHouse.new
    2.times { @rent_house.stations.build }
  end

  # GET /rent_houses/1/edit
  def edit
    @rent_house.stations.build
  end

  # POST /rent_houses or /rent_houses.json
  def create
    @rent_house = RentHouse.new(rent_house_params)

    respond_to do |format|
      if @rent_house.save
        format.html { redirect_to @rent_house, notice: "物件を登録しました！" }
        format.json { render :show, status: :created, location: @rent_house }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rent_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rent_houses/1 or /rent_houses/1.json
  def update
    respond_to do |format|
      if @rent_house.update(rent_house_params)
        format.html { redirect_to @rent_house, notice: "物件を編集しました！" }
        format.json { render :show, status: :ok, location: @rent_house }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rent_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_houses/1 or /rent_houses/1.json
  def destroy
    @rent_house.destroy
    respond_to do |format|
      format.html { redirect_to rent_houses_url, notice: "Rent house was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent_house
      @rent_house = RentHouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_house_params
      params.require(:rent_house).permit(:house_name, :rent, :address, :age, :remaks, stations_attributes: [
        :route_name, :station_name, :on_foot, :rent_house_id, :id, :_destroy])
    end
end
