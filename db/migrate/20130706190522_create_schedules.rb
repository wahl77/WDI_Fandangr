class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :movie
      t.datetime :playing_at
      t.references :room

      t.timestamps
    end
    add_index :schedules, :movie_id
    add_index :schedules, :room_id
  end
end
