class ShiftsController < ApplicationController
  before_action :authenticate_user!

  layout false

  def index
    if params[:type] == Shift::AVAILABILITY
      @availabilities = current_user.availabilities
    else
      @seekings = current_user.seekings
    end
  end

  def create
    begin
      shift = current_user.shifts.create! slot_type: shift_params[:slot_type],
                                          start_date: shift_params[:start_date],
                                          end_date: shift_params[:end_date]
    rescue StandardError => e
      flash[:error] = e.message
    ensure
      if shift.slot_type == Shift::AVAILABILITY
        redirect_to availabilities_path
      else
        redirect_to seekings_path
      end
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:slot_type, :start_date, :end_date)
  end
end
