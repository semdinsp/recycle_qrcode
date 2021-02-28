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

ActiveRecord::Schema.define(version: 2021_02_28_140654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "actiontypes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "entity_id", null: false
    t.string "user"
    t.integer "atype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_id"], name: "index_actiontypes_on_entity_id"
  end

  create_table "entities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "etype"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "location_id"
  end

  create_table "kv_pairs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "key"
    t.string "value"
    t.uuid "entity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_id"], name: "index_kv_pairs_on_entity_id"
    t.index ["key"], name: "index_kv_pairs_on_key"
  end

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.uuid "entity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "actiontype_id"
    t.string "locatable_type"
    t.uuid "locatable_id"
    t.index ["entity_id"], name: "index_locations_on_entity_id"
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable"
  end

  create_table "route_members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "route_order"
    t.uuid "route_id", null: false
    t.uuid "entity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.index ["entity_id"], name: "index_route_members_on_entity_id"
    t.index ["route_id"], name: "index_route_members_on_route_id"
  end

  create_table "routes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "truck_id", null: false
    t.string "name"
    t.string "info"
    t.string "dayofweek"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["truck_id"], name: "index_routes_on_truck_id"
  end

  create_table "trucks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.string "owner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "actiontypes", "entities"
  add_foreign_key "kv_pairs", "entities"
  add_foreign_key "locations", "entities"
  add_foreign_key "route_members", "entities"
  add_foreign_key "route_members", "routes"
  add_foreign_key "routes", "trucks"
end
