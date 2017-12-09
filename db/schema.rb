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

ActiveRecord::Schema.define(version: 20171209114019) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.float    "arpu",           limit: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "visitors_count",           default: 0
    t.integer  "price",                    default: 0
    t.integer  "rating",                   default: 0
    t.text     "logs"
    t.string   "city"
  end

  create_table "event_exceptions", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "activity_id"
    t.datetime "start_time"
    t.text     "recurring"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "visitor_id"
    t.integer  "medium_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "histories", ["medium_id"], name: "index_histories_on_medium_id"
  add_index "histories", ["visitor_id"], name: "index_histories_on_visitor_id"

  create_table "mediums", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
