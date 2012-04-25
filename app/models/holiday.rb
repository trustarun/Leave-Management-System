class Holiday < ActiveRecord::Base

  require 'lib/calender'
  include LeaveCalender

  def self.week_day(no)
    day_name = { "1" => "mon","2" => "tue", "3" => "wed", "4" => "thu", "5" => "fri", "6" => "sat", "7" => "sun" }
    day_name["no"]
  end

  def self.holiday_between_leaves(start_date, end_date)
    if start_date.year != end_date.year
      start_month = Holiday.where(:month => start_date.month, :day => [start_date.day..31], :year => start_date.year )
      end_month = Holiday.where(:month => end_date.month, :day => [1..end_date.day], :year => end_date.year)
      holidays = start_month + end_month
    elsif start_date.month != end_date.month
      start_month = Holiday.where(:month => start_date.month, :day => [start_date.day..31], :year => start_date.year)
      end_month = Holiday.where(:month => end_date.month, :day => [1..end_date.day], :year => start_date.year)
      holidays = start_month + end_month
    else
      holidays = Holiday.where(:month => start_date.month, :day => [start_date.day..end_date.day], :year => start_date.year)
    end
    holidays_in_date_formate = []
    holidays.each do |holiday|
      holidays_in_date_formate << Date.new(holiday.year, holiday.month, holiday.day)
    end
    holidays_in_date_formate
  end

end
