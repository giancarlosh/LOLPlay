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

ActiveRecord::Schema.define(version: 20160928135653) do

  create_table "matches", force: :cascade do |t|
    t.string   "name"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.string   "user1"
    t.string   "user2"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "wins"
    t.integer  "losses"
    t.float    "win_ratio"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "size"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "rol"
    t.boolean  "status",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "summoner_id"
    t.integer  "matches_",               default: 0
    t.string   "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
