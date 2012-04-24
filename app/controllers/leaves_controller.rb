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
    @leave.user_id = current_user.id
    @leave.manager_id = current_user.manager
    @leave.status = "pending"
    if @leave.valid?
      @leave.save
      redirect_to leaves_path
    else
      render 'new'
    end
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
      if leave.update_attribute("status","Approved")
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
