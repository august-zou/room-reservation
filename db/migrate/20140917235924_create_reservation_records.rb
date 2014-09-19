class CreateReservationRecords < ActiveRecord::Migration
  def change
    create_table :reservation_records do |t|
      t.integer :room_id
      t.integer :user_id
      t.datetime :start_datetime
      t.datetime :stop_datetime
      t.string :usage
      t.text :remarks
      t.integer :status,  default: 1
      t.timestamps
    end
  end
end
