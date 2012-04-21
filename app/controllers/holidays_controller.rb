class HolidaysController < ApplicationController

  def index
    @title = "Leave-Calender"
    holiday = Holiday.new
    @next = params[:next].present? ? params[:next].to_i + 1 : 0
    @date = params[:next].blank? ? Date.today : Date.today >> @next
    @days = holiday.days_array(@date)
    @holiday = [3, 5, 6,7]
  end

end
