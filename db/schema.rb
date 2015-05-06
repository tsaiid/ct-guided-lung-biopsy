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

ActiveRecord::Schema.define(version: 20150506122245) do

  create_table "biopsies", force: :cascade do |t|
    t.string   "patient_id",              null: false
    t.string   "accession_no",            null: false
    t.integer  "biopsy_needle_size",      null: false
    t.integer  "coaxial_needle_size"
    t.boolean  "use_contrast_media",      null: false
    t.string   "anesthesia"
    t.string   "position",                null: false
    t.string   "lesion_location",         null: false
    t.integer  "lesion_size",             null: false
    t.boolean  "lesion_is_cavitary",      null: false
    t.string   "lesion_type",             null: false
    t.integer  "pleural_distance",        null: false
    t.string   "emphysema_degree",        null: false
    t.string   "patient_cooperation",     null: false
    t.string   "pneumothorax_degree",     null: false
    t.string   "pneumothorax_management"
    t.string   "hemorrhage_degree",       null: false
    t.boolean  "has_hemoptysis",          null: false
    t.boolean  "has_chest_tightness",     null: false
    t.boolean  "has_asthma",              null: false
    t.string   "other_complications"
    t.integer  "biopsy_numbers",          null: false
    t.integer  "formalin_numbers"
    t.integer  "saline_numbers"
    t.integer  "aerobic_swab_numbers"
    t.integer  "anaerobic_swab_numbers"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "patient_name"
    t.string   "patient_gender"
    t.string   "patient_age"
    t.date     "exam_date"
  end

  create_table "radiologists", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "no",         null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
