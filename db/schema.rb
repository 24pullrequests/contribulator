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

ActiveRecord::Schema.define(version: 2016_04_21_143043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.integer "github_id", null: false
    t.string "url", null: false
    t.string "title", null: false
    t.string "state"
    t.integer "comments", default: 0
    t.datetime "closed_at"
    t.text "body"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "homepage"
    t.string "main_language"
    t.integer "github_id"
    t.boolean "fork", default: false
    t.float "score", default: 0.0
    t.text "description"
    t.datetime "last_scored"
    t.index "date(last_scored)", name: "index_projects_on_date_last_scored"
    t.index "lower((main_language)::text)", name: "index_projects_on_lower_main_language"
    t.index "lower((name)::text)", name: "index_projects_on_lower_name"
    t.index "lower((owner)::text)", name: "index_projects_on_lower_owner"
    t.index ["score"], name: "index_projects_on_score"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "nickname", null: false
    t.string "gravatar_id"
    t.string "token"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
  end

end
