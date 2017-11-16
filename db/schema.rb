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

ActiveRecord::Schema.define(version: 20171116105010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.integer  "price"
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.string   "condition"
    t.boolean  "availability"
    t.integer  "seller_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "photo"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "rentals", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total_price"
    t.string   "status"
    t.integer  "bike_id"
    t.integer  "buyer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["bike_id"], name: "index_rentals_on_bike_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "address"
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bikes", "users", column: "seller_id"
  add_foreign_key "rentals", "bikes"
  add_foreign_key "rentals", "users", column: "buyer_id"
end
