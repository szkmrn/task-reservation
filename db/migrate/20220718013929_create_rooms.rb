class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id, foreign_key: true
      t.string :name, null: false
      t.text :information, null: false
      t.integer :price, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
