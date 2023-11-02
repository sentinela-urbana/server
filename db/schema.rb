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

ActiveRecord::Schema[7.0].define(version: 2023_11_02_181953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.string "complement"
    t.bigint "postal_code_id", null: false
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
    t.index ["postal_code_id"], name: "index_addresses_on_postal_code_id"
  end

  create_table "postal_codes", force: :cascade do |t|
    t.string "code"
    t.string "neighbourhood"
    t.string "city"
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_postal_codes_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_regions_on_code", unique: true
  end

  create_table "spots", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_spots_on_address_id"
    t.index ["region_id"], name: "index_spots_on_region_id"
  end

  create_table "surveillance_regions", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_surveillance_regions_on_region_id"
    t.index ["user_id"], name: "index_surveillance_regions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "taxpayer_registry", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "role", null: false
    t.string "address"
    t.string "streetNumber"
    t.string "phone"
    t.datetime "birth_date"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["taxpayer_registry"], name: "index_users_on_taxpayer_registry"
  end

  add_foreign_key "surveillance_regions", "regions"
  add_foreign_key "surveillance_regions", "users"
end
