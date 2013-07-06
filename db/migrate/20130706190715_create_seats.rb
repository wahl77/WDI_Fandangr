class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :pos_x
      t.integer :pos_y
      t.references :room

      t.timestamps
    end
    add_index :seats, :room_id
  end
end
