# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_13_120432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fio"
    t.string "reason"
    t.string "symptoms"
    t.string "location"
    t.string "state"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "email"
    t.string "phone"
    t.string "inn"
    t.string "ogrn"
    t.string "address"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity_type"
    t.boolean "nvos_checked", default: false
    t.integer "clame_counter", default: 0
    t.decimal "longitude", precision: 15, scale: 10
    t.decimal "latitude", precision: 15, scale: 10
  end

  create_table "company_okveds", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "okved_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_okveds_on_company_id"
    t.index ["okved_id"], name: "index_company_okveds_on_okved_id"
  end

  create_table "okveds", force: :cascade do |t|
    t.string "section", null: false
    t.string "code"
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "dangerous", default: false
    t.index ["code"], name: "okved_code", unique: true
  end

  create_table "order_companies", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_order_companies_on_company_id"
    t.index ["order_id"], name: "index_order_companies_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.text "comment"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "order_companies", "companies"
  add_foreign_key "order_companies", "orders"
end
