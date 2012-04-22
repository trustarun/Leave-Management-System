class HolidaysController < ApplicationController

  def index
    @title = "Leave-Calender"
    @holiday = Holiday.new
    @date = (params[:year].present? && params[:month].present?) ? Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i) : Date.today
    @next = 1
    @prev = 1
    if request.xhr?
      shift_calender = (params[:next].present?) ? @date >> 1 : @date << 1
      @date = (params[:next].blank? && params[:prev].blank?)? Date.today : shift_calender
    end
    @days = @holiday.days_array(@date)
    @holiday = Holiday.where(:month => @date.month, :year => @date.year).map(&:day)
  end

  def create
    month = params[:month]
    year = params[:year]
    @next = params[:next]
    @prev = params[:prev]
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
    redirect_to holidays_path(:year => year , :month =>month, :day => params[:current_day])
  end

end
