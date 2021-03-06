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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140917235924) do

  create_table "reservation_records", force: true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "start_datetime"
    t.datetime "stop_datetime"
    t.string   "usage"
    t.text     "remarks"
    t.integer  "status",         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "staff_name"
    t.string   "staff_phone"
    t.text     "remarks"
    t.integer  "status",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "real_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.integer  "status",          default: 0
    t.boolean  "is_admin",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
