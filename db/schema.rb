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

ActiveRecord::Schema.define(version: 20160602080741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "order_date"
    t.boolean  "completed",  default: false
    t.string   "status",     default: "new"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "status",      default: "new"
  end

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  add_index "tasks_users", ["task_id"], name: "index_tasks_users_on_task_id", using: :btree
  add_index "tasks_users", ["user_id"], name: "index_tasks_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  null: false
    t.string   "password",   limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
