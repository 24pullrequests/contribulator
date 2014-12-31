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

ActiveRecord::Schema.define(version: 20141231123356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.string   "homepage"
    t.string   "main_language"
    t.integer  "github_id"
    t.boolean  "fork",          default: false
    t.float    "score",         default: 0.0
    t.text     "description"
    t.datetime "last_scored"
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid",         null: false
    t.string   "nickname",    null: false
    t.string   "gravatar_id"
    t.string   "token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree

end
