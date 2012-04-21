class Holiday < ActiveRecord::Base

  require 'lib/calender'
  include LeaveCalender

  def self.week_day(no)
    day_name = { "1" => "mon","2" => "tue", "3" => "wed", "4" => "thu", "5" => "fri", "6" => "sat", "7" => "sun" }
    day_name["no"]
  end

end
