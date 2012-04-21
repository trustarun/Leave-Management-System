class HolidaysController < ApplicationController

  def index
    @title = "Leave-Calender"
    @holiday = Holiday.new
    @next = (params[:next].present?) ? params[:next].to_i + 1 : 0
    @date = params[:next].blank? ? Date.today : Date.today >> @next
    @days = @holiday.days_array(@date)
    @holiday = Holiday.where(:month => @date.month, :year => @date.year).map(&:day)
  end

  def create
    month = params[:month]
    year = params[:year]
    @next = params[:next]
    existing_holiday = Holiday.where(:month => month, :year => year)
    existing_holiday.each do |holiday|
      holiday.delete
    end
    day_as_holiday = []
    params[:day].each{ |key,val| day_as_holiday << val if val.present?}
    total_holiday = day_as_holiday.size
    count = 0
    while count < total_holiday
      day = day_as_holiday[count]
      holiday = Holiday.new
      holiday.day = day_as_holiday[count]
      holiday.wday = holiday.day_of_week(year.to_i, month.to_i, day.to_i )
      holiday.month = month
      holiday.year = year
      holiday.save
      count = count + 1
    end
    redirect_to ((@next.present? && @next == "0") ? holidays_path : holidays_path(:next => @next.to_i-1))
  end

end
