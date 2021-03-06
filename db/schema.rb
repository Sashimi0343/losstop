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

ActiveRecord::Schema.define(version: 2021_07_01_192023) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "auctions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.string "active"
    t.integer "category_id", null: false
    t.integer "delivery_charge_id", null: false
    t.date "deadline", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_auctions_on_user_id"
  end

  create_table "bazaars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.date "deadline", null: false
    t.string "active"
    t.integer "category_id", null: false
    t.integer "delivery_charge_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_bazaars_on_company_id"
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "president", null: false
    t.string "profile", null: false
    t.string "phone"
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "homepage"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "contact_auctions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "message", null: false
    t.bigint "order_auction_id", null: false
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contact_auctions_on_company_id"
    t.index ["order_auction_id"], name: "index_contact_auctions_on_order_auction_id"
    t.index ["user_id"], name: "index_contact_auctions_on_user_id"
  end

  create_table "contact_bazaars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "message", null: false
    t.bigint "order_bazaar_id", null: false
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_contact_bazaars_on_company_id"
    t.index ["order_bazaar_id"], name: "index_contact_bazaars_on_order_bazaar_id"
    t.index ["user_id"], name: "index_contact_bazaars_on_user_id"
  end

  create_table "notice_companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "visitor_user_id", null: false
    t.integer "visited_company_id", null: false
    t.integer "order_bazaar_id"
    t.integer "contact_bazaar_id"
    t.integer "bazaar_id"
    t.integer "review_bazaar_id"
    t.integer "order_auction_id"
    t.integer "contact_auction_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bazaar_id"], name: "index_notice_companies_on_bazaar_id"
    t.index ["contact_auction_id"], name: "index_notice_companies_on_contact_auction_id"
    t.index ["contact_bazaar_id"], name: "index_notice_companies_on_contact_bazaar_id"
    t.index ["order_auction_id"], name: "index_notice_companies_on_order_auction_id"
    t.index ["order_bazaar_id"], name: "index_notice_companies_on_order_bazaar_id"
    t.index ["review_bazaar_id"], name: "index_notice_companies_on_review_bazaar_id"
    t.index ["visited_company_id"], name: "index_notice_companies_on_visited_company_id"
    t.index ["visitor_user_id"], name: "index_notice_companies_on_visitor_user_id"
  end

  create_table "order_auctions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.string "active"
    t.bigint "auction_id", null: false
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_order_auctions_on_auction_id"
    t.index ["company_id"], name: "index_order_auctions_on_company_id"
    t.index ["user_id"], name: "index_order_auctions_on_user_id"
  end

  create_table "order_bazaars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity", null: false
    t.string "active"
    t.bigint "bazaar_id", null: false
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bazaar_id"], name: "index_order_bazaars_on_bazaar_id"
    t.index ["company_id"], name: "index_order_bazaars_on_company_id"
    t.index ["user_id"], name: "index_order_bazaars_on_user_id"
  end

  create_table "review_bazaars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "comment", null: false
    t.bigint "bazaar_id", null: false
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bazaar_id"], name: "index_review_bazaars_on_bazaar_id"
    t.index ["company_id"], name: "index_review_bazaars_on_company_id"
    t.index ["user_id"], name: "index_review_bazaars_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "profile"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "auctions", "users"
  add_foreign_key "bazaars", "companies"
  add_foreign_key "contact_auctions", "companies"
  add_foreign_key "contact_auctions", "order_auctions"
  add_foreign_key "contact_auctions", "users"
  add_foreign_key "contact_bazaars", "companies"
  add_foreign_key "contact_bazaars", "order_bazaars"
  add_foreign_key "contact_bazaars", "users"
  add_foreign_key "order_auctions", "auctions"
  add_foreign_key "order_auctions", "companies"
  add_foreign_key "order_auctions", "users"
  add_foreign_key "order_bazaars", "bazaars"
  add_foreign_key "order_bazaars", "companies"
  add_foreign_key "order_bazaars", "users"
  add_foreign_key "review_bazaars", "bazaars"
  add_foreign_key "review_bazaars", "companies"
  add_foreign_key "review_bazaars", "users"
end
