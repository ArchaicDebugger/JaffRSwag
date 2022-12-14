# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_10_090659) do
  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.date "year_founded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videogames", force: :cascade do |t|
    t.string "title"
    t.string "developer"
    t.string "publisher"
    t.date "release_date"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
