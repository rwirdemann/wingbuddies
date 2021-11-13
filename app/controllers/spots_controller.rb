class SpotsController < ApplicationController

  def index
    @spots = Spot.order(:dayname)
    @spot = Spot.new
  end

  def show 
    @spots = Spot.order(:dayname)
    @spot = Spot.find(params[:id])
    render :index
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    redirect_to spots_path
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.save
    redirect_to spots_path
  end

  private
    def spot_params
      params.require(:spot).permit(:name, :windfinder)
    end
end
