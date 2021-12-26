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

ActiveRecord::Schema.define(version: 2021_12_26_151934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.string "colour"
    t.string "size"
    t.string "link"
    t.string "detail"
    t.boolean "item_bought"
    t.integer "family_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bought_by"
    t.boolean "archived", default: false
    t.index ["family_id"], name: "index_items_on_family_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "pipes", id: :serial, force: :cascade do |t|
    t.integer "from_id"
    t.string "from_type"
    t.integer "to_id"
    t.string "to_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id", "from_type"], name: "index_pipes_on_from_id_and_from_type"
    t.index ["to_id", "to_type"], name: "index_pipes_on_to_id_and_to_type"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_to_families", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_users_to_families_on_family_id"
    t.index ["user_id"], name: "index_users_to_families_on_user_id"
  end

  add_foreign_key "users_to_families", "families"
  add_foreign_key "users_to_families", "users"
end
