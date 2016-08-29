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

ActiveRecord::Schema.define(version: 20160829212645) do

  create_table "items", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.float    "price"
    t.integer  "total_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "units_per_sale",                 default: 1
    t.integer  "num_purchased",                  default: 0
    t.string   "category"
  end

  add_index "items", ["name"], name: "index_items_on_name"
  add_index "items", ["sale_id"], name: "index_items_on_sale_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name",       limit: 255
    t.string   "join_code",          limit: 255
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "organizations", ["name"], name: "index_organizations_on_name", unique: true

  create_table "sales", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "organization_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sales", ["organization_id"], name: "index_sales_on_organization_id"

  create_table "shopper_items", force: :cascade do |t|
    t.integer  "shopper_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  add_index "shopper_items", ["item_id"], name: "index_shopper_items_on_item_id"
  add_index "shopper_items", ["shopper_id"], name: "index_shopper_items_on_shopper_id"

  create_table "shoppers", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "sale_id"
    t.boolean  "ready_for_checkout"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
  end

end
