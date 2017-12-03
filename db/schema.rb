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

ActiveRecord::Schema.define(version: 20171125160653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertises", force: :cascade do |t|
    t.integer  "newspaper_id"
    t.string   "title"
    t.string   "state"
    t.string   "description"
    t.date     "idate"
    t.date     "lastdate"
    t.integer  "organization_id"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["newspaper_id"], name: "index_advertises_on_newspaper_id", using: :btree
    t.index ["organization_id"], name: "index_advertises_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_advertises_on_user_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.integer "country_id"
    t.integer "state_id"
    t.string  "name"
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "degrees", force: :cascade do |t|
    t.integer "tdegree_id"
    t.string  "name"
    t.index ["tdegree_id"], name: "index_degrees_on_tdegree_id", using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.integer "tdegree_id"
    t.integer "degree_id"
    t.string  "subject"
    t.integer "city_id"
    t.integer "institute_id"
    t.integer "tmarks"
    t.integer "omarks"
    t.integer "persent"
    t.string  "division"
    t.date    "passyear"
    t.integer "user_id"
    t.index ["city_id"], name: "index_educations_on_city_id", using: :btree
    t.index ["degree_id"], name: "index_educations_on_degree_id", using: :btree
    t.index ["institute_id"], name: "index_educations_on_institute_id", using: :btree
    t.index ["tdegree_id"], name: "index_educations_on_tdegree_id", using: :btree
    t.index ["user_id"], name: "index_educations_on_user_id", using: :btree
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "designation"
    t.integer  "profession_id"
    t.integer  "city_id"
    t.integer  "organization_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["city_id"], name: "index_experiences_on_city_id", using: :btree
    t.index ["organization_id"], name: "index_experiences_on_organization_id", using: :btree
    t.index ["profession_id"], name: "index_experiences_on_profession_id", using: :btree
    t.index ["user_id"], name: "index_experiences_on_user_id", using: :btree
  end

  create_table "institutes", force: :cascade do |t|
    t.integer "city_id"
    t.string  "name"
    t.index ["city_id"], name: "index_institutes_on_city_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "advertise_id"
    t.integer "profession_id"
    t.integer "qty"
    t.integer "degree_id"
    t.integer "city_id"
    t.index ["advertise_id"], name: "index_jobs_on_advertise_id", using: :btree
    t.index ["city_id"], name: "index_jobs_on_city_id", using: :btree
    t.index ["degree_id"], name: "index_jobs_on_degree_id", using: :btree
    t.index ["profession_id"], name: "index_jobs_on_profession_id", using: :btree
  end

  create_table "newspapers", force: :cascade do |t|
    t.string "name"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.integer  "profession_id"
    t.integer  "degree_id"
    t.integer  "city_id"
    t.integer  "advertise_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["advertise_id"], name: "index_searches_on_advertise_id", using: :btree
    t.index ["city_id"], name: "index_searches_on_city_id", using: :btree
    t.index ["degree_id"], name: "index_searches_on_degree_id", using: :btree
    t.index ["profession_id"], name: "index_searches_on_profession_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "tdegrees", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "fname"
    t.date     "dob"
    t.string   "cnic"
    t.string   "gender"
    t.integer  "state_id"
    t.integer  "city_id"
    t.text     "address"
    t.text     "skills"
    t.string   "resume"
    t.boolean  "admin"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["state_id"], name: "index_users_on_state_id", using: :btree
  end

  create_table "userskills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
    t.string  "lastd"
    t.index ["skill_id"], name: "index_userskills_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_userskills_on_user_id", using: :btree
  end

  add_foreign_key "advertises", "newspapers"
  add_foreign_key "advertises", "organizations"
  add_foreign_key "advertises", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "states"
  add_foreign_key "degrees", "tdegrees"
  add_foreign_key "educations", "cities"
  add_foreign_key "educations", "degrees"
  add_foreign_key "educations", "institutes"
  add_foreign_key "educations", "tdegrees"
  add_foreign_key "educations", "users"
  add_foreign_key "experiences", "cities"
  add_foreign_key "experiences", "organizations"
  add_foreign_key "experiences", "professions"
  add_foreign_key "experiences", "users"
  add_foreign_key "institutes", "cities"
  add_foreign_key "jobs", "advertises"
  add_foreign_key "jobs", "cities"
  add_foreign_key "jobs", "degrees"
  add_foreign_key "jobs", "professions"
  add_foreign_key "searches", "advertises"
  add_foreign_key "searches", "cities"
  add_foreign_key "searches", "degrees"
  add_foreign_key "searches", "professions"
  add_foreign_key "states", "countries"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "states"
  add_foreign_key "userskills", "skills"
  add_foreign_key "userskills", "users"
end
