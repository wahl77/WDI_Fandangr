# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130707174024) do

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.integer  "duration"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "poster"
    t.string   "rating"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.integer  "seat_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reservations", ["schedule_id"], :name => "index_reservations_on_schedule_id"
  add_index "reservations", ["seat_id"], :name => "index_reservations_on_seat_id"
  add_index "reservations", ["user_id"], :name => "index_reservations_on_user_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "movie_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "room_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedules", ["movie_id"], :name => "index_schedules_on_movie_id"
  add_index "schedules", ["room_id"], :name => "index_schedules_on_room_id"

  create_table "seats", :force => true do |t|
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.integer  "room_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "seats", ["room_id"], :name => "index_seats_on_room_id"

  create_table "users", :force => true do |t|
    t.string   "uun"
    t.string   "password_digest"
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
