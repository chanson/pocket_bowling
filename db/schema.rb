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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_014745) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bracket_event_participants", force: :cascade do |t|
    t.integer "event_participant_id"
    t.integer "total_brackets"
    t.integer "bracket_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bracket_session_id"], name: "index_bracket_event_participants_on_bracket_session_id"
    t.index ["event_participant_id"], name: "index_bracket_event_participants_on_event_participant_id"
  end

  create_table "bracket_seeds", force: :cascade do |t|
    t.integer "bracket_event_participant_id"
    t.integer "event_participant_id"
    t.integer "bracket_number"
    t.integer "bracket_session_id"
    t.integer "seed"
    t.boolean "alive", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bracket_event_participant_id"], name: "index_bracket_seeds_on_bracket_event_participant_id"
    t.index ["bracket_session_id"], name: "index_bracket_seeds_on_bracket_session_id"
    t.index ["event_participant_id"], name: "index_bracket_seeds_on_event_participant_id"
  end

  create_table "bracket_sessions", force: :cascade do |t|
    t.integer "event_id"
    t.integer "event_squad_id"
    t.integer "size"
    t.float "cost"
    t.string "type"
    t.jsonb "payouts", default: "{}", null: false
    t.integer "starting_game"
    t.boolean "reverse", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_participants", force: :cascade do |t|
    t.integer "event_series_user_id"
    t.integer "event_id"
    t.integer "event_squad_id"
    t.integer "scores", default: [], array: true
    t.integer "handicap"
    t.integer "prize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["event_series_user_id"], name: "index_event_participants_on_event_series_user_id"
    t.index ["event_squad_id"], name: "index_event_participants_on_event_squad_id"
  end

  create_table "event_series", force: :cascade do |t|
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string "primary_type"
    t.integer "team_size"
    t.integer "handicap_base"
    t.float "handicap_percent"
    t.integer "max_handicap_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_datetime"], name: "index_event_series_on_end_datetime"
    t.index ["start_datetime"], name: "index_event_series_on_start_datetime"
  end

  create_table "event_series_users", force: :cascade do |t|
    t.integer "event_series_id"
    t.integer "user_id"
    t.string "roles", default: [], array: true
    t.boolean "contact"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_series_id", "user_id"], name: "index_event_series_users_on_event_series_id_and_user_id"
    t.index ["user_id"], name: "index_event_series_users_on_user_id"
  end

  create_table "event_squads", force: :cascade do |t|
    t.integer "event_id"
    t.integer "squad_number"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "squad_number"], name: "index_event_squads_on_event_id_and_squad_number"
  end

  create_table "events", force: :cascade do |t|
    t.integer "event_series_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.integer "team_size"
    t.integer "handicap_base"
    t.float "handicap_percent"
    t.integer "max_handicap_score"
    t.integer "total_games"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["end_datetime"], name: "index_events_on_end_datetime"
    t.index ["event_series_id"], name: "index_events_on_event_series_id"
    t.index ["start_datetime"], name: "index_events_on_start_datetime"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
