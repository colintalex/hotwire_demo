class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def create
    @vehicle = Vehicle.create(fake_vehicle_params)
  end

  def edit
    @vehicle = Vehicle.find_by(id: params[:id])
  end

  def update
    @vehicle = Vehicle.find_by(id: params[:id])
    @vehicle.update(vehicle_params)
  end

  def destroy
    @vehicle = Vehicle.find_by(id: params[:id])
    @vehicle.destroy!
  end

  private

  def fake_vehicle_params
    make = Faker::Vehicle.make
    return {
      make: make,
      model: Faker::Vehicle.model(make_of_model: make),
      year: Faker::Vehicle.year,
      color: Faker::Vehicle.color
    }
  end

  def vehicle_params
    params.require(:vehicle).permit(
      :make,
      :model,
      :year,
      :color
    )
  end
end
