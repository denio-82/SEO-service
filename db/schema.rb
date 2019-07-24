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

ActiveRecord::Schema.define(version: 2019_07_24_103638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pages", force: :cascade do |t|
    t.string "url", null: false
    t.bigint "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_pages_on_site_id"
    t.index ["url"], name: "index_pages_on_url"
  end

  create_table "robots_txts", force: :cascade do |t|
    t.bigint "site_id"
    t.text "content", null: false
    t.string "last_modified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_robots_txts_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "domain", null: false
    t.boolean "https", default: false
    t.boolean "www_subdomain", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_sites_on_domain"
  end

  add_foreign_key "pages", "sites"
  add_foreign_key "robots_txts", "sites"
end
