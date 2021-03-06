class TrucksController < ApplicationController
  before_action :set_truck, only: [ :edit, :update, :destroy, :show ]

  def index
    @trucks = Truck.all
    @booking = Booking.new
  end

  def show
  end

  def my_trucks
   @trucks = current_user.trucks
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    @truck.user = current_user
    if @truck.save
      redirect_to my_trucks_path
    else
      render "new"
    end
  end

  def update
    @truck.update(truck_params)
    redirect_to truck_path(@truck)
  end

  def edit
  end

  def destroy
    @truck.delete
    redirect_to my_trucks_path
  end

  private

  def set_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:gauge, :category, :description, :availability, :numberplate, :price, :user_id)
  end
end
