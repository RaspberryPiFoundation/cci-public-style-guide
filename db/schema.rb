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

ActiveRecord::Schema.define(version: 20151119175033) do

  create_table "pages", force: :cascade do |t|
    t.string   "path",         limit: 255
    t.string   "title",        limit: 255
    t.integer  "order",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "section_id",   limit: 4
    t.boolean  "show_in_nav"
    t.boolean  "example_page"
    t.integer  "back_page_id", limit: 4
  end

  add_index "pages", ["section_id"], name: "index_pages_on_section_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "path",        limit: 255
    t.string   "title",       limit: 255
    t.integer  "order",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "show_in_nav"
  end

end
