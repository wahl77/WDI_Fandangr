class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :schedule
      t.references :seat

      t.timestamps
    end
    add_index :reservations, :user_id
    add_index :reservations, :schedule_id
    add_index :reservations, :seat_id
  end
end
