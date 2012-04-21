class Holiday < ActiveRecord::Base

  require 'lib/calender'
  include LeaveCalender

end
