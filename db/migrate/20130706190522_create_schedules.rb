class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :movie
      t.datetime :start_time
      t.datetime :end_time
      t.references :room

      t.timestamps
    end
    add_index :schedules, :movie_id
    add_index :schedules, :room_id
  end
end
