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

ActiveRecord::Schema.define(version: 2022_02_22_145520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "date"
    t.string "topic"
    t.integer "price"
    t.bigint "politician_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["politician_id"], name: "index_bookings_on_politician_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "politician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["politician_id"], name: "index_bookmarks_on_politician_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "full_name"
    t.integer "age"
    t.text "biography"
    t.string "expertise"
    t.string "skills"
    t.string "reach"
    t.string "location"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.float "stars"
    t.text "comment"
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.bigint "politician_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_ratings_on_booking_id"
    t.index ["politician_id"], name: "index_ratings_on_politician_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "organization_name"
    t.string "sector"
    t.string "location"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "politicians"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookmarks", "politicians"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "ratings", "bookings"
  add_foreign_key "ratings", "politicians"
  add_foreign_key "ratings", "users"
end
