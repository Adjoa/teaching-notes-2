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

ActiveRecord::Schema.define(version: 20180323191345) do

  create_table "attendances", force: :cascade do |t|
    t.integer "student_id"
    t.integer "rehearsal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "going"
    t.boolean "went"
    t.index ["rehearsal_id"], name: "index_attendances_on_rehearsal_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "student_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_entries_on_student_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "time"
    t.string "venue"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_events_on_teacher_id"
  end

  create_table "rehearsals", force: :cascade do |t|
    t.integer "event_id"
    t.datetime "time"
    t.string "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rehearsals_on_event_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "password_digest"
    t.string "name"
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
