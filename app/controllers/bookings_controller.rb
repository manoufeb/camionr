class BookingsController < ApplicationController
  before_action :set_truck, only: [ :edit, :update, :destroy, :show ]

  # def index
  #   @bookings = Booking.where(user: current_user)
  # end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to root_path #user_path(current_user)
    else
      render 'new'
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to root_path #user_path(current_user)
  end

  def edit
  end

  def destroy
    @booking.delete
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :location, :description, :truck_id)
  end
end

