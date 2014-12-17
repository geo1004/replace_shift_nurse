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
end
