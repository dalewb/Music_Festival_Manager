class BookingsController < ApplicationController
  before_action :find_booking, :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    byebug
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(performance_id: params[:performance_id], schedule_id: params[:schedule_id])

    if @booking.valid?
      redirect_to schedule_path(@booking.schedule)
    else
      flash[:errors] = @booking.errors.full_messages
      redirect_to schedule_path(@booking.schedule)
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)

    if @booking.valid?
      redirect_to schedule_path(@booking.schedule)
    else
      flash[:errors] = @booking.errors.full_messages
      redirect_to edit_booking_path(@booking)
    end
  end

  def destroy
    @booking.destroy
    redirect_to schedule_path(@booking.schedule)
  end

<<<<<<< HEAD
  def find_user
    if params[:friend_name]
      @user = User.find_by(name: params[:friend_name])
      redirect_to user_path(@user)
    end 
  end


=======
>>>>>>> cb18a840045a57a367ee333aff2c54f1d160bbfd
  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_user
    @user = User.find(session[:user_id])
  end

  # def booking_params
  #   params.require(:booking).permit(:performance_id, :schedule_id)
  # end
end
