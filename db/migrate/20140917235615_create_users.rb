class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :real_name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.integer :status,  default: 0
      t.boolean :is_admin, default: false
      t.timestamps
    end
  end
end
