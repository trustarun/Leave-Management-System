class Leave < ActiveRecord::Base

  belongs_to :user
  validates   :start_date, :end_date, :reason_for_leave, :presence => true
  
end
