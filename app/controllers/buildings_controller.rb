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

    respond_to do |format|
      if @building.save
       format.html { redirect_to new_building_path, notice: "You have successfully entered a new building record" }
      else
        format.html { render action: 'new' }
      end
    end
  end



private

  def menu_items
    @buildings ||= Building.all
  end
  def building_params
    params.require(:building).permit(:street_address, :description, :city, :state, :postal_code, :owner_id)
  end

end
