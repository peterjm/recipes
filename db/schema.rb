# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_08_023836) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ingredient_names", force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ingredient_id"], name: "index_ingredient_names_on_ingredient_id"
    t.index ["name"], name: "index_ingredient_names_on_name"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "staple", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "grams_per_ml"
    t.index ["name"], name: "index_ingredients_on_name"
  end

  create_table "recipe_flags", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.index ["recipe_id"], name: "index_recipe_flags_on_recipe_id", unique: true
  end

  create_table "recipe_images", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "source_image_url"
    t.string "image_uid"
    t.index ["recipe_id"], name: "index_recipe_images_on_recipe_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", default: "", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.text "ingredients_text"
    t.text "instructions_text"
    t.string "basic_source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "recipe_image_id"
    t.text "notes"
    t.integer "source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "source_type", null: false
    t.string "name", null: false
    t.string "author"
    t.string "url"
    t.text "description"
    t.string "image_uid"
    t.index ["name"], name: "index_sources_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
