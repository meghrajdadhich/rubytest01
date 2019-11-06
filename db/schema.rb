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

ActiveRecord::Schema.define(version: 20191104160121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "csvimporters", force: :cascade do |t|
    t.string   "pri"
    t.text     "question"
    t.string   "teaming"
    t.integer  "appears"
    t.integer  "frequency"
    t.string   "qtype"
    t.string   "role"
    t.boolean  "required"
    t.string   "conditions"
    t.string   "mapping"
    t.string   "sessionid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.string   "mapping_str"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "pri"
    t.text     "quiz"
    t.string   "teamingStages"
    t.integer  "appearsDay"
    t.integer  "frequency"
    t.string   "qType"
    t.string   "required"
    t.string   "conditions"
    t.integer  "mapping_id"
    t.integer  "role_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["mapping_id"], name: "index_questions_on_mapping_id", using: :btree
    t.index ["role_id"], name: "index_questions_on_role_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_str"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "questions", "mappings"
  add_foreign_key "questions", "roles"
end
