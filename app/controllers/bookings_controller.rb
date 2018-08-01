class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @meal = Meal.find(params[:meal_id])
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @booking = Booking.new(booking_params)
    @booking.meal = @meal
    @booking.price = @meal.price
    @booking.user = current_user
    if @booking.save
      redirect_to meal_booking_path(@meal, @booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end

  private
  def booking_params
    params.require(:booking).permit(:time)
  end
end
