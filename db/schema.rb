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

ActiveRecord::Schema.define(version: 20140109150913) do

  create_table "answers", force: true do |t|
    t.string   "english_text"
    t.string   "spanish_text"
    t.integer  "answers_set_id"
    t.integer  "posistion"
    t.integer  "legacy_response_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["answers_set_id"], name: "index_answers_on_answers_set_id"

  create_table "answers_sets", force: true do |t|
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers_sets", ["question_id"], name: "index_answers_sets_on_question_id"

  create_table "checkpoints", force: true do |t|
    t.integer  "student_id"
    t.integer  "type"
    t.integer  "actor"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkpoints", ["student_id"], name: "index_checkpoints_on_student_id"

  create_table "completed_checkpoints", force: true do |t|
    t.integer  "checkpoint_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completed_checkpoints", ["checkpoint_id", "student_id"], name: "index_completed_checkpoints_on_checkpoint_id_and_student_id"

  create_table "courses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "has_answers", force: true do |t|
    t.integer  "answers_set_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_answers", ["answer_id", "answers_set_id"], name: "index_has_answers_on_answer_id_and_answers_set_id"

  create_table "has_answers_sets", force: true do |t|
    t.integer  "answers_set_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_answers_sets", ["answers_set_id", "question_id"], name: "index_has_answers_sets_on_answers_set_id_and_question_id"

  create_table "has_questions", force: true do |t|
    t.integer  "question_id"
    t.integer  "checkpoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "has_questions", ["question_id", "checkpoint_id"], name: "index_has_questions_on_question_id_and_checkpoint_id"

  create_table "instructional_coaches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parent_questions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "parent_question_id"
    t.integer  "answer_type"
    t.string   "name"
    t.integer  "posistion"
    t.string   "english_text"
    t.string   "spanish_text"
    t.integer  "checkpoint_id"
    t.integer  "answers_set_id"
    t.string   "legacy_question_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["answers_set_id"], name: "index_questions_on_answers_set_id"
  add_index "questions", ["checkpoint_id"], name: "index_questions_on_checkpoint_id"
  add_index "questions", ["parent_question_id"], name: "index_questions_on_parent_question_id"

  create_table "schools", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
