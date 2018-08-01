class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
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
      render :show
    else
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:time)
  end
end
