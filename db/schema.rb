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

ActiveRecord::Schema.define(version: 20160119023021) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "profile_id"
    t.integer  "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["entry_id"], name: "index_comments_on_entry_id"
  add_index "comments", ["profile_id"], name: "index_comments_on_profile_id"

  create_table "entries", force: :cascade do |t|
    t.boolean  "received"
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "private"
    t.integer  "linked_profile_id"
    t.datetime "occurred_on"
  end

  add_index "entries", ["profile_id"], name: "index_entries_on_profile_id"

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "families", ["name"], name: "index_families_on_name"

  create_table "love_banks", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "love_banks", ["profile_id"], name: "index_love_banks_on_profile_id"

  create_table "moods", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "moods", ["profile_id"], name: "index_moods_on_profile_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email"
  add_index "profiles", ["family_id"], name: "index_profiles_on_family_id"

end
