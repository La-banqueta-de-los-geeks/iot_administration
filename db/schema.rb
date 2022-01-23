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

ActiveRecord::Schema.define(version: 2022_01_23_034402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "device_groups", force: :cascade do |t|
    t.string "name"
    t.bigint "device_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_device_groups_on_device_id"
  end

  create_table "device_ports", force: :cascade do |t|
    t.bigint "device_id", null: false
    t.string "status"
    t.string "port"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_device_ports_on_device_id"
  end

  create_table "device_ports_port_values", force: :cascade do |t|
    t.bigint "device_port_id", null: false
    t.bigint "port_value_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_port_id"], name: "index_device_ports_port_values_on_device_port_id"
    t.index ["port_value_id"], name: "index_device_ports_port_values_on_port_value_id"
  end

  create_table "device_sequences", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "device_group_id"
    t.index ["device_group_id"], name: "index_device_sequences_on_device_group_id"
  end

  create_table "devices", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_devices_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "port_values", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_port_values_on_organization_id"
  end

  create_table "sequences", force: :cascade do |t|
    t.bigint "device_sequence_id", null: false
    t.bigint "device_port_id", null: false
    t.bigint "port_value_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_port_id"], name: "index_sequences_on_device_port_id"
    t.index ["device_sequence_id"], name: "index_sequences_on_device_sequence_id"
    t.index ["port_value_id"], name: "index_sequences_on_port_value_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token"
    t.string "entity_type"
    t.bigint "entity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type", "entity_id"], name: "index_tokens_on_entity_type_and_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "locale", default: "es"
    t.string "type"
    t.bigint "organization_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "device_groups", "devices"
  add_foreign_key "device_ports", "devices"
  add_foreign_key "device_ports_port_values", "device_ports"
  add_foreign_key "device_ports_port_values", "port_values"
  add_foreign_key "devices", "organizations"
  add_foreign_key "port_values", "organizations"
  add_foreign_key "sequences", "device_ports"
  add_foreign_key "sequences", "device_sequences"
  add_foreign_key "sequences", "port_values"
end
