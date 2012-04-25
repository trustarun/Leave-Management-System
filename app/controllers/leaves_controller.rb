class LeavesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :manager_required, :only => [:leave_to_approve, :approve_leave]
  
  def index
    @leaves = Leave.where(:user_id => current_user.id)
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(params[:leave])
    p "#{params[:leave][:start_date].split("/")}"
    p "KKKKKKKKKKKKKKKKKKKKKkk"
    start_date = @leave.string_to_date(params[:leave][:start_date])
    end_date = @leave.string_to_date(params[:leave][:end_date])
    @working_day = working_day_leaves(start_date, end_date)
    @holiday_day = Holiday.holiday_between_leaves(start_date, end_date)
    @leave.user_id = current_user.id
    @leave.manager_id = current_user.manager
    @leave.status = "pending"
    @leave.working_days = @working_day.count
    @leave.holiday_days = @holiday_day.count
    @leave.total_days = @working_day.count + @holiday_day.count
    if @leave.valid?
      @leave.save
      LmsMailer.applied_for_leave(@leave, current_user, @working_day, @holiday_day).deliver
      redirect_to leaves_path
    else
      render 'new'
    end
  end

  def working_day_leaves(start_date, end_date)
    holiday_array = Holiday.holiday_between_leaves(start_date, end_date)
    leave_array = Leave.new.leave_array(start_date, end_date)
    leave_array.reject{ |d| holiday_array.include?(d)}
  end

  def show
    @leave = Leave.find(params[:id])
  end

  def edit
    @leave = Leave.find(params[:id])
  end

  def update
    @leave = Leave.find(params[:id])
    @leave.attributes = params[:leave]
    @leave.user_id = current_user.id
    @leave.manager_id = current_user.manager
    @leave.status = "pending"
    if @leave.valid?
      @leave.save
      redirect_to leaves_path
    else
      render 'edit'
    end
  end

  def destroy
    @leave = Leave.find(params[:id])
    @leave.delete
    redirect_to leaves_path
  end

  def leave_to_approve
    @leaves = Leave.where(:manager_id => current_user.id, :status => "pending")
  end

  def approve_leave
      leave = Leave.find(params[:id])
      status = params[:rejected].present? ? params[:rejected] : "Approved"
      if leave.update_attribute("status",status)
       LmsMailer.leave_approved(leave,current_user).deliver
       flash[:notice] = "Leave updated successfully"
       redirect_to leave_to_approve_leaves_path
      end
  end

  def manager_required
    if current_user && current_user.is_manager?
      true
    else
      flash[:notice] = "You are not authorized to Approve Leaves"
      redirect_to new_user_session_path
    end
  end

end
