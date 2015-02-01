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

ActiveRecord::Schema.define(version: 20150201200119) do

  create_table "ingredient_names", force: :cascade do |t|
    t.integer  "ingredient_id",             null: false
    t.string   "name",          limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_names", ["ingredient_id"], name: "index_ingredient_names_on_ingredient_id"
  add_index "ingredient_names", ["name"], name: "index_ingredient_names_on_name"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",         limit: 255,                 null: false
    t.boolean  "staple",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "grams_per_ml"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name"

  create_table "recipe_images", force: :cascade do |t|
    t.integer  "recipe_id",        null: false
    t.string   "image",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_image_url"
  end

  add_index "recipe_images", ["recipe_id"], name: "index_recipe_images_on_recipe_id"

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id",                  null: false
    t.integer  "ingredient_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",          default: "", null: false
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "title",             limit: 255, null: false
    t.text     "ingredients_text"
    t.text     "instructions_text"
    t.string   "basic_source",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_image_id"
    t.text     "notes"
    t.integer  "source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "type",   null: false
    t.string "name",   null: false
    t.string "author"
    t.string "url"
  end

  add_index "sources", ["name"], name: "index_sources_on_name", unique: true

end
