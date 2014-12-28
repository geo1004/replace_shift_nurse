class CalendarController < ApplicationController
  before_action :authenticate_user!

  def seekings
    @seekings = current_user.seekings
    render 'index'
  end

  def availabilities
    @availabilities = current_user.availabilities
    render 'index'
  end
end
