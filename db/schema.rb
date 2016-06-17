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

ActiveRecord::Schema.define(version: 20160524051754) do

  create_table "cadastra_searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "monuments" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "parcel_identity_linkages", force: :cascade do |t|
    t.integer  "identity_plan_detail_id"
    t.integer  "parcel_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "parcel_identity_linkages", ["parcel_id"], name: "index_parcel_identity_linkages_on_parcel_id"

  create_table "parcel_linkages", force: :cascade do |t|
    t.string   "linkage_parcel_number"
    t.integer  "parcel_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "parcel_linkages", ["parcel_id"], name: "index_parcel_linkages_on_parcel_id"

# Could not dump table "parcels" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "plan_details", force: :cascade do |t|
    t.string   "plan_number",                               null: false
    t.string   "description"
    t.string   "submission_date"
    t.string   "compiled"
    t.string   "field_note_flag"
    t.string   "surveyor"
    t.integer  "cadastra_search_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "lots"
    t.string   "linkage_plan_numbers"
    t.text     "children_plan_number", default: "--- []\n"
    t.text     "existing_parcels",     default: "--- []\n"
  end

  add_index "plan_details", ["plan_number"], name: "index_plan_details_on_plan_number"

  create_table "plan_linkages", force: :cascade do |t|
    t.string   "linkage_plan_number"
    t.integer  "plan_detail_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "plan_linkages", ["plan_detail_id"], name: "index_plan_linkages_on_plan_detail_id"

  create_table "plan_lots", force: :cascade do |t|
    t.string   "lot_number"
    t.integer  "plan_detail_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "plan_lots", ["plan_detail_id"], name: "index_plan_lots_on_plan_detail_id"

  create_table "qld_lot_plan_searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
