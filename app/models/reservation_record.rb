class ReservationRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  validates :room, presence: true
  validates :start_datetime, presence: true
  validates :stop_datetime, presence: true
  validate :validate_reservation_time

  scope :validate_reservation_time, ->(room_id,start_datetime,stop_datetime){
    where("room_id = ? AND start_datetime between ? and ? OR stop_datetime between ? and ?", room_id,
    start_datetime+1.minute, stop_datetime, start_datetime+1.minute,stop_datetime)
}

  private
  def validate_reservation_time
    id_search = self.id 
    id_search = -1 unless self.persisted?

    if self.start_datetime && self.stop_datetime 
      errors[:base] << "开始时间必须大于结束时间" if self.start_datetime >= self.stop_datetime
      errors[:base] << "预约时间冲突" if !ReservationRecord.validate_reservation_time(self.room_id,
          self.start_datetime,self.stop_datetime).where.not(id: self.id).empty?
    end
  end

end
