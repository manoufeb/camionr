class TrucksController < ApplicationController
before_action :set_truck, only: [ :edit, :update, :destroy ]

  def update
    @truck.update(truck_params)
    redirect_to truck_path(@truck)
  end

  def edit
  end

  def destroy
    @truck.delete
    redirect_to trucks_path
  end

  private

  def set_truck
    @truck = truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:type, :category, :description, :availability, :numberplate, :price, :user_id)
  end
end
