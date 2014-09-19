class Room < ActiveRecord::Base
  has_many :reservation_records
end
