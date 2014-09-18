class User < ActiveRecord::Base
    has_secure_password

     validates :name, presence: true,length: { minumum:3, maximum: 20 }, uniqueness: true
end
