class Leave < ActiveRecord::Base

  belongs_to :user
  validates   :start_date, :end_date, :reason_for_leave, :user_id, :manager_id, :presence => true
  
end
