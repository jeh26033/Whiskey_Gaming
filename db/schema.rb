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

ActiveRecord::Schema.define(version: 20171204174709) do

  create_table "matches", force: :cascade do |t|
    t.string "uid"
    t.string "winner"
    t.datetime "started_at"
    t.string "mode"
    t.string "match_type"
    t.string "duration"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "match_id"
    t.string "uid"
    t.text "hero"
    t.integer "level"
    t.integer "kills"
    t.integer "deaths"
    t.integer "assists"
    t.integer "last_hits"
    t.integer "denies"
    t.integer "gold"
    t.integer "gpm"
    t.integer "xpm"
    t.integer "status"
    t.integer "gold_spent"
    t.integer "hero_damage"
    t.integer "tower_damage"
    t.integer "hero_healing"
    t.text "items"
    t.integer "slot"
    t.boolean "radiant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "additional_units"
    t.text "ability_upgrades"
    t.index ["match_id"], name: "index_players_on_match_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "nickname"
    t.string "avatar_url"
    t.string "profile_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

end
