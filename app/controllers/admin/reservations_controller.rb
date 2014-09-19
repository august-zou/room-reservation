class Admin::ReservationsController < ApplicationController
  def index
    @reservation_records = ReservationRecord.paginate(:page => params[:page])
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
