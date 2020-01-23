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

ActiveRecord::Schema.define(version: 20200123195452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.string   "colour"
    t.string   "size"
    t.string   "link"
    t.string   "detail"
    t.boolean  "item_bought"
    t.integer  "family_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "bought_by"
    t.boolean  "archived",    default: false
    t.index ["family_id"], name: "index_items_on_family_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "pipes", force: :cascade do |t|
    t.integer  "from_id"
    t.string   "from_type"
    t.integer  "to_id"
    t.string   "to_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id", "from_type"], name: "index_pipes_on_from_id_and_from_type", using: :btree
    t.index ["to_id", "to_type"], name: "index_pipes_on_to_id_and_to_type", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
