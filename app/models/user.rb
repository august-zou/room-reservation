class User < ActiveRecord::Base
  has_secure_password
  has_many :reservation_records, dependent: :destroy
  validates :name, presence: true,length: { minumum:2, maximum: 20 }, uniqueness: true
end
