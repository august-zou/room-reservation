class HomeController < ApplicationController
  def index
    @reservation_records = ReservationRecord.paginate(:page => params[:page])
  end
end
