class BookingsController < ApplicationController
  before_action :set_truck, only: [ :new, :create, :edit, :update, :destroy, :show ]

  def index
    @confirmed_bookings = current_user.truck_bookings.where(status: "confirmed")
    @bookings = Booking.all
  end

  def pending_bookings
    @pending_bookings = current_user.truck_bookings.where(status: "pending")
    @pending_bookings_as_customer = current_user.bookings.where(status: "pending")
    #booking qui sont pending et qui sont sur mes trucks
  end

  def refused_bookings
    @refused_bookings = current_user.truck_bookings.where(status: "refused")
  end

  def validate
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    if @booking.save
      redirect_to pending_bookings_path
    else
      render 'pending_bookings'
    end
  end

  def refuse_booking
    @booking.status = "refused"
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.truck = @truck
    @booking.status = "pending"
    if @booking.save
      redirect_to pending_bookings_path #user_path(current_user)
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

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :location, :description, :truck_id, :user_id, :status)
  end
end

