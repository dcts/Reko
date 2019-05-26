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

ActiveRecord::Schema.define(version: 2019_05_25_124657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audiobooks", force: :cascade do |t|
    t.integer "itunes_id"
    t.string "image_url"
    t.string "title"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentaries", force: :cascade do |t|
    t.integer "itunes_id"
    t.string "image_url"
    t.string "title"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.integer "itunes_id"
    t.string "image_url"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "podcasts", force: :cascade do |t|
    t.integer "itunes_id"
    t.string "image_url"
    t.string "title"
    t.string "episode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rekos", force: :cascade do |t|
    t.bigint "asker_id"
    t.string "teller_name"
    t.string "content_type"
    t.bigint "content_id"
    t.integer "status", default: 0
    t.index ["asker_id"], name: "index_rekos_on_asker_id"
    t.index ["content_type", "content_id"], name: "index_rekos_on_content_type_and_content_id"
  end

  create_table "series", force: :cascade do |t|
    t.integer "itunes_id"
    t.string "image_url"
    t.string "title"
    t.integer "year"
    t.integer "season"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rekos", "users", column: "asker_id"
end
