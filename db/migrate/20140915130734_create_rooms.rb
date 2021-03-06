class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :staff_name
      t.string :staff_phone
      t.text :remarks
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
