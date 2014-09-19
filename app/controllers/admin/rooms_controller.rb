class Admin::RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(:page => params[:page])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
