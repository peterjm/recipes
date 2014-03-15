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

ActiveRecord::Schema.define(version: 20140315222751) do

  create_table "ingredients", force: true do |t|
    t.string   "name",       null: false
    t.boolean  "staple",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name"

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "recipe_id",     null: false
    t.integer  "ingredient_id", null: false
    t.string   "quantity"
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "title",        null: false
    t.text     "ingredients"
    t.text     "instructions"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
