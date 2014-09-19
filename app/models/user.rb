class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true,length: { minumum:2, maximum: 20 }, uniqueness: true
  has_many :reservation_records
end
