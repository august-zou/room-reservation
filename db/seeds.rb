
u = User.create(:name=>"zx",:password=>"admin123",:password_confirmation=>"admin123",:is_admin => true)
r = Room.create(:name=>"会议室101",:staff_name=>"李军",:staff_phone=>"13656634693")
ReservationRecord.create(:user => u, :room => r, :start_datetime => Time.now, :stop_datetime => Time.now + 1.day)

10.times do |i|
  User.create(:name=>"zx"+i.to_s,:password=>"admin123",:password_confirmation=>"admin123")
end