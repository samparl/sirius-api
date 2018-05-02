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

ActiveRecord::Schema.define(version: 20180502011337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line_1",     null: false
    t.string   "line_2"
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.integer  "zip",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses_customers", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "address_id",  null: false
  end

  create_table "carriers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_carriers_on_name", unique: true, using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "middle_name"
    t.string   "password_digest", null: false
    t.string   "email",           null: false
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "fulfillment_locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_fulfillment_locations_on_address_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "sku",         null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["sku"], name: "index_items_on_sku", using: :btree
  end

  create_table "items_shipments", id: false, force: :cascade do |t|
    t.integer "item_id",     null: false
    t.integer "shipment_id", null: false
  end

  create_table "items_vendors", id: false, force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.integer "item_id",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "status",      null: false
    t.integer  "order_id"
    t.integer  "vendor_id"
    t.integer  "carrier_id"
    t.integer  "origin_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["carrier_id"], name: "index_shipments_on_carrier_id", using: :btree
    t.index ["location_id"], name: "index_shipments_on_location_id", using: :btree
    t.index ["order_id"], name: "index_shipments_on_order_id", using: :btree
    t.index ["origin_id"], name: "index_shipments_on_origin_id", using: :btree
    t.index ["vendor_id"], name: "index_shipments_on_vendor_id", using: :btree
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_vendors_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_vendors_on_name", using: :btree
  end

  add_foreign_key "fulfillment_locations", "addresses"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "customers"
  add_foreign_key "shipments", "addresses", column: "origin_id"
  add_foreign_key "shipments", "carriers"
  add_foreign_key "shipments", "fulfillment_locations", column: "location_id"
  add_foreign_key "shipments", "orders"
  add_foreign_key "shipments", "vendors"
end
