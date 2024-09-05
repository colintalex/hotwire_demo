class MapsController < ApplicationController
  def index
    @vehicles = Vehicle.all
    render :index
  end

  def map_data
    @lat = params[:lat].to_f
    @lon = params[:lon].to_f

    respond_to do |f|
      f.turbo_stream
    end
  end
end
