# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_10_025234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers_subscriptions", force: :cascade do |t|
    t.bigint "customers_id", null: false
    t.bigint "subscriptions_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customers_id"], name: "index_customers_subscriptions_on_customers_id"
    t.index ["subscriptions_id"], name: "index_customers_subscriptions_on_subscriptions_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.integer "frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions_teas", force: :cascade do |t|
    t.bigint "teas_id", null: false
    t.bigint "subscriptions_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscriptions_id"], name: "index_subscriptions_teas_on_subscriptions_id"
    t.index ["teas_id"], name: "index_subscriptions_teas_on_teas_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "brew_time"
    t.integer "temperature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "customers_subscriptions", "customers", column: "customers_id"
  add_foreign_key "customers_subscriptions", "subscriptions", column: "subscriptions_id"
  add_foreign_key "subscriptions_teas", "subscriptions", column: "subscriptions_id"
  add_foreign_key "subscriptions_teas", "teas", column: "teas_id"
end
