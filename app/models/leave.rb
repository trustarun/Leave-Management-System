class Leave < ActiveRecord::Base
  require 'lib/calender'
  include LeaveCalender
  
  belongs_to :user
  validates   :start_date, :end_date, :reason_for_leave, :user_id, :manager_id, :presence => true

  def leave_array(start_date, end_date)
    actual_start = actual_start_date(start_date)
    actual_end = actual_end_date(end_date)
    l_date_array = []
    no_of_days = (actual_end -actual_start).day
    for no_of_day in 1..10
      l_date_array << actual_start
      actual_start = actual_start + 1
    end
    l_date_array
  end

  def string_to_date(p_date)
    str_array = p_date.split("/")
    convert_to_date(str_array[2].to_i, str_array[0].to_i, str_array[1].to_i)
  end
end
