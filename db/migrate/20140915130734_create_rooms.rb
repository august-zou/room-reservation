class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :staff_name
      t.string :staff_phone
      t.text :remark
      t.integer :status

      t.timestamps
    end
  end
end
