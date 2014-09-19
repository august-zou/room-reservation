class Admin::RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(:page => params[:page])
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "您成功添加了一间会议室信息"
      redirect_to admin_rooms_path
    else
      render 'new' 
    end
  end

  def edit
   @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "用户信息更新成功"
      redirect_to admin_rooms_path
    else
      render 'edit' 
    end
  end

  def destroy
    @room=Room.find(params[:id])
    if @room.destroy
      flash[:success] = "你已删除本条预约记录"
    else
      flash[:danger] = "删除失败"
    end
    redirect_to admin_rooms_path
  end

  private
  def room_params
    permited = params.required(:room).permit(:name, :staff_name, :staff_phone,:remarks)
  end
end
