class Room < ActiveRecord::Base
  has_many :reservation_records, dependent: :destroy

  validates :name, presence: true
  validates :staff_name, presence: true
  validates :staff_phone, presence: true
end
