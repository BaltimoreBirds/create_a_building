class BuildingsController < ApplicationController
    helper_method :buildings
  def index


  end

  def show
    @building = Building.find(params[:id])
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to new_building_path,
        notice: "You have successfully entered a new building record"
    else
      render :new
    end
  end

private
  def building_params
    params.require(:building).permit(:street_address, :description, :city, :state, :postal_code)
  end

end
