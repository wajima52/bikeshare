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

ActiveRecord::Schema.define(version: 20180128071926) do

  create_table "bicycles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "place"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "user_id"
    t.string "place2"
    t.index ["user_id"], name: "index_bicycles_on_user_id"
  end

  create_table "matchings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "renter_id"
    t.integer "borrower_id"
    t.integer "bicycle_id"
    t.integer "matching_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "return_message"
    t.index ["bicycle_id"], name: "index_matchings_on_bicycle_id"
    t.index ["borrower_id"], name: "index_matchings_on_borrower_id"
    t.index ["renter_id", "borrower_id"], name: "index_matchings_on_renter_id_and_borrower_id", unique: true
    t.index ["renter_id"], name: "index_matchings_on_renter_id"
  end

  create_table "relationships", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "rental_bicycle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_bicycle_id"], name: "index_relationships_on_rental_bicycle_id"
    t.index ["user_id", "rental_bicycle_id"], name: "index_relationships_on_user_id_and_rental_bicycle_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username", default: "anonymous"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bicycles", "users"
  add_foreign_key "matchings", "bicycles"
  add_foreign_key "matchings", "users", column: "borrower_id"
  add_foreign_key "matchings", "users", column: "renter_id"
  add_foreign_key "relationships", "bicycles", column: "rental_bicycle_id"
  add_foreign_key "relationships", "users"
end
