# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150312214226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "internships", force: :cascade do |t|
    t.string  "company_name"
    t.string  "contact_name"
    t.string  "contact_phone"
    t.string  "contact_email"
    t.string  "company_website"
    t.string  "company_address"
    t.string  "company_description"
    t.string  "intern_work"
    t.string  "intern_ideal"
    t.string  "intern_count"
    t.boolean "intern_clearance"
    t.string  "intern_clearance_description"
    t.string  "mentor_name"
    t.string  "mentor_email"
    t.string  "mentor_phone"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "internship_id"
    t.integer  "company_rating"
    t.integer  "project_rating"
    t.integer  "personality_rating"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "ratings", ["internship_id"], name: "index_ratings_on_internship_id", using: :btree
  add_index "ratings", ["student_id"], name: "index_ratings_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "role"
  end

end
