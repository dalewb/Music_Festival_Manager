class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    byebug
    @schedule = Schedule.create(schedule_params)

    if @schedule.valid?
      redirect_to schedule_path
    else
      flash[:errors] = @schedule.errors.full_messages
      redirect_to new_schedule_path
    end
  end

  def edit
  end

  def update
    @schedule.update(schedule_params)

    if @schedule.valid?
      redirect_to @schedule
    else
      flash[:errors] = @schedule.errors.full_messages
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  def friend_schedule
    @
  end


  private

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:name, :user_id)
  end

end
