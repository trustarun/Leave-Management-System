class LmsMailer < ActionMailer::Base
  
  def applied_for_leave(leave, user, working_days, leave_days)
    @leave = leave
    @user = user
    @working_days = working_days
    @leave_days = leave_days
    mail(:to => user.manager.email, :subject => "Leave request for #{leave.total_days}", :from => user.email)
  end

  def leave_approved(leave,user, status)
    @leave = leave
    @user = user
    @status = status
    mail(:to => leave.user.email, :subject => "Leave request", :from => user.email)
  end

end
