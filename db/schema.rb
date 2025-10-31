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

ActiveRecord::Schema[7.0].define(version: 2025_10_28_120000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "back_skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "rank", null: false
    t.string "tag", null: false
    t.string "about"
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "front_skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "rank", null: false
    t.string "tag", null: false
    t.string "about"
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string "title", null: false
    t.string "date", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infra_skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "rank", null: false
    t.string "tag", null: false
    t.string "about"
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", null: false
    t.string "date", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string "title", null: false
    t.string "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "rank", null: false
    t.string "tag", null: false
    t.string "about"
    t.string "icon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name", null: false
    t.string "date", null: false
    t.json "tag", null: false
    t.string "topImg", null: false
    t.string "front_url"
    t.string "back_url"
    t.string "front_github"
    t.string "back_github"
    t.string "color"
    t.string "about"
    t.string "aboutImg"
    t.string "function"
    t.string "functionImg"
    t.string "appeal"
    t.string "appealImg"
    t.json "front_skill"
    t.json "back_skill"
    t.json "infra_skill"
    t.string "time", null: false
    t.string "prev_title"
    t.string "prev_article_id"
    t.string "next_title"
    t.string "next_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
