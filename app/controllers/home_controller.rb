class HomeController < ApplicationController
  def index
    @reservation_records = ReservationRecord.where("stop_datetime >= ?",Time.now).order(:start_datetime).paginate(:page => params[:page])
  end
end
