class BookingsController < ApplicationController
  before_action :set_truck, only: [ :new, :create, :edit, :update, :destroy, :show ]

  def index
    @bookings = Booking.all
  end

  def status_bookings
    @pending_bookings_as_owner = current_user.truck_bookings.where(status: "En attente")
    @confirmed_bookings_as_owner = current_user.truck_bookings.where(status: "Confirmé")

    @refused_bookings = current_user.truck_bookings.where(status: "Refusé")
    # @sum_confirmed_price = @confirmed_bookings_as_owner
  end

  def validate
    @booking = Booking.find(params[:id])
    @booking.status = "Confirmé"
    if @booking.save
      redirect_to status_bookings_path
    else
      render 'status_bookings'
    end
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.status = "Refusé"
    if @booking.save
      redirect_to status_bookings_path
    else
      render 'status_bookings'
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.truck = @truck
    @booking.status = "En attente"
    if @booking.save
      redirect_to status_bookings_path #user_path(current_user)
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

