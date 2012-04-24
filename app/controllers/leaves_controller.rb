class LeavesController < ApplicationController
  before_filter :authenticate_user!
  
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
end
