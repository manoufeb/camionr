class TrucksController < ApplicationController
  before_action :set_truck, only: [ :edit, :update, :destroy, :show ]

  def index
    @trucks = Truck.all
  end 

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)
    if @truck.save
      redirect_to truck_path(@truck)
    else
      render 'new'
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
    redirect_to trucks_path
  end

  def show
  end


private

   def set_truck
     @truck = truck.find(params[:id])
   end

   def truck_params
     params.require(:truck).permit(:gauge, :category, :description, :availability, :numberplate, :price, :user_id)
   end
end
