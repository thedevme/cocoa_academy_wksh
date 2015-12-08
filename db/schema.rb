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

ActiveRecord::Schema.define(version: 20151208015431) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.string   "sku"
    t.decimal  "price"
    t.string   "event_image"
    t.string   "event_thumb_image"
    t.string   "details"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.string   "sku"
    t.decimal  "price"
    t.string   "product_image"
    t.string   "details"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "email"
    t.integer  "amount"
    t.string   "description"
    t.string   "currency"
    t.string   "customer_id"
    t.string   "card"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "uuid"
  end

  create_table "schedule_days", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedule_days", ["product_id"], name: "index_schedule_days_on_product_id"

  create_table "schedule_events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "instructor"
    t.time     "start_time"
    t.string   "icon",            default: "fa-clock-o"
    t.integer  "schedule_day_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "schedule_events", ["schedule_day_id"], name: "index_schedule_events_on_schedule_day_id"

end
