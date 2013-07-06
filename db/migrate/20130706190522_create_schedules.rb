class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :movie
      t.date :playing_day
      t.time :playing_time
      t.references :room

      t.timestamps
    end
    add_index :schedules, :movie_id
    add_index :schedules, :room_id
  end
end
