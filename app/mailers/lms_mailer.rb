class LmsMailer < ActionMailer::Base
  
  def applied_for_leave(leave, user)
    mail(:to => user.manager.email, :subject => "Leave request for #{leave.total_days}", :from => user.email)
  end

  def leave_approved(leave,user)
    mail(:to => leave.user.email, :subject => "Leave request", :from => user.email)
  end

end
