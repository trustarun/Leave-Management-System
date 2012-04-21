class Leave < ActiveRecord::Base
  validates   :start_date, :end_date, :reason_for_leave, :presence => true
end
