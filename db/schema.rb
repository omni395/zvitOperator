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

ActiveRecord::Schema.define(version: 20170203070320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "article"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "article_description"
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
  end

  create_table "expences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "expence_description"
    t.decimal  "expence_value"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "expence"
    t.index ["user_id"], name: "index_expences_on_user_id", using: :btree
  end

  create_table "material_payments", force: :cascade do |t|
    t.decimal  "quantity"
    t.integer  "payment_id"
    t.integer  "material_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["material_id"], name: "index_material_payments_on_material_id", using: :btree
    t.index ["payment_id"], name: "index_material_payments_on_payment_id", using: :btree
  end

  create_table "materials", force: :cascade do |t|
    t.string   "material_name"
    t.decimal  "material_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string   "client_address"
    t.string   "client_name"
    t.decimal  "client_payment"
    t.string   "client_description"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "client_new_connection"
    t.decimal  "payment_total",         default: "0.0"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "user_name"
    t.integer  "role_id"
    t.boolean  "active"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "articles", "users"
  add_foreign_key "expences", "users"
  add_foreign_key "material_payments", "materials"
  add_foreign_key "material_payments", "payments"
  add_foreign_key "payments", "users"
  add_foreign_key "users", "roles"
end
