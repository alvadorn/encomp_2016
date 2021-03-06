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

ActiveRecord::Schema.define(version: 20160909132646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name",       default: ""
    t.text     "desc",       default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "day",                     null: false
    t.integer  "value",                   null: false
    t.integer  "vacancies"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "queue_classic_jobs", id: :bigserial, force: :cascade do |t|
    t.text     "q_name",                                null: false
    t.text     "method",                                null: false
    t.json     "args",                                  null: false
    t.datetime "locked_at"
    t.integer  "locked_by"
    t.datetime "created_at",   default: -> { "now()" }
    t.datetime "scheduled_at", default: -> { "now()" }
    t.index ["q_name", "id"], name: "idx_qc_on_name_only_unlocked", where: "(locked_at IS NULL)", using: :btree
    t.index ["scheduled_at", "id"], name: "idx_qc_on_scheduled_at_only_unlocked", where: "(locked_at IS NULL)", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: ""
    t.string   "email",                  default: "",            null: false
    t.string   "encrypted_password",     default: "",            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,             null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "paid",                   default: false,         null: false
    t.boolean  "admin",                  default: false,         null: false
    t.boolean  "removed",                default: false,         null: false
    t.boolean  "auxiliar",               default: false,         null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "accomodation"
    t.string   "shirt",                  default: "P-Masculino"
    t.string   "cpf"
    t.string   "phone"
    t.string   "address"
    t.string   "university"
    t.string   "course"
    t.string   "team_name"
    t.integer  "payment_preference",     default: 0
    t.boolean  "terms_agree"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
