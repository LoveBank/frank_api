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

ActiveRecord::Schema.define(version: 20160531012233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "frank_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "frank_profile_id"
    t.integer  "frank_entry_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "frank_comments", ["frank_entry_id"], name: "index_frank_comments_on_frank_entry_id", using: :btree
  add_index "frank_comments", ["frank_profile_id"], name: "index_frank_comments_on_frank_profile_id", using: :btree

  create_table "frank_entries", force: :cascade do |t|
    t.boolean  "received"
    t.boolean  "private"
    t.integer  "rating"
    t.text     "note"
    t.datetime "occurred_on"
    t.integer  "linked_profile_id"
    t.integer  "integer"
    t.integer  "frank_profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "frank_entries", ["frank_profile_id"], name: "index_frank_entries_on_frank_profile_id", using: :btree
  add_index "frank_entries", ["integer"], name: "index_frank_entries_on_integer", using: :btree
  add_index "frank_entries", ["linked_profile_id"], name: "index_frank_entries_on_linked_profile_id", using: :btree

  create_table "frank_families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frank_families", ["name"], name: "index_frank_families_on_name", using: :btree

  create_table "frank_links", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "frank_profile_id"
    t.integer  "to_profile_id"
  end

  add_index "frank_links", ["frank_profile_id"], name: "index_frank_links_on_frank_profile_id", using: :btree

  create_table "frank_love_banks", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "frank_profile_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "frank_love_banks", ["frank_profile_id"], name: "index_frank_love_banks_on_frank_profile_id", using: :btree

  create_table "frank_moods", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "frank_profile_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "frank_moods", ["frank_profile_id"], name: "index_frank_moods_on_frank_profile_id", using: :btree

  create_table "frank_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "frank_profile_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "frank_posts", ["frank_profile_id"], name: "index_frank_posts_on_frank_profile_id", using: :btree

  create_table "frank_profiles", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "frank_family_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "last_daily_report_id"
  end

  add_index "frank_profiles", ["email"], name: "index_frank_profiles_on_email", using: :btree
  add_index "frank_profiles", ["frank_family_id"], name: "index_frank_profiles_on_frank_family_id", using: :btree

  add_foreign_key "frank_comments", "frank_entries"
  add_foreign_key "frank_comments", "frank_profiles"
  add_foreign_key "frank_entries", "frank_profiles"
  add_foreign_key "frank_links", "frank_profiles"
  add_foreign_key "frank_love_banks", "frank_profiles"
  add_foreign_key "frank_moods", "frank_profiles"
  add_foreign_key "frank_posts", "frank_profiles"
  add_foreign_key "frank_profiles", "frank_families"
end
