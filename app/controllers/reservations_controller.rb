class ReservationsController < ApplicationController
  def index
    @reservation_records = current_user.reservation_records.paginate(:page => params[:page])
  end

  def edit
    @reservation_record=ReservationRecord.find(params[:id])
  end

  def new
     @reservation_record = ReservationRecord.new
  end

  def create
    @reservation_record = ReservationRecord.new(reservation_params)
    if @reservation_record.save
      flash[:success] = "您的预约已成功提交"
      redirect_to reservations_path
    else
      render 'new' 
    end
  end

  def update
    @reservation_record = ReservationRecord.find(params[:id])
    if @reservation_record.update_attributes(reservation_params)
        flash[:success] = "保存成功" 
    else
        flash[:danger] = "保存失败"
    end
    render 'edit'
  end

  def destroy
    @reservation_record=ReservationRecord.find(params[:id])
    if @reservation_record.destroy
      flash[:success] = "你已删除本条预约记录"
    else
      flash[:danger] = "删除失败"
    end
    redirect_to reservations_path
  end

  private
  def reservation_params
    permited = params.required(:reservation_record).permit(:room_id, :start_datetime, :stop_datetime,:usage,:remarks)  
    permited[:user_id] = current_user.id
    permited
  end
end
