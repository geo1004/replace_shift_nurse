class CalendarController < ApplicationController
  before_action :authenticate_user!

  def index
    @availabilities = current_user.availabilities
    @seekings = current_user.seekings
  end
end
