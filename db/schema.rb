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

ActiveRecord::Schema.define(version: 20180528210239) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 50
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "branches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.string "name", limit: 50
    t.text "description", limit: 255
    t.bigint "group_branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_branch_id"], name: "index_branches_on_group_branch_id"
  end

  create_table "composition_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.bigint "cover_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cover_id"], name: "index_composition_products_on_cover_id"
    t.index ["product_id"], name: "index_composition_products_on_product_id"
  end

  create_table "covers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.string "name", limit: 50
    t.text "description", limit: 255
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_covers_on_branch_id"
  end

  create_table "deadline_short_longs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.string "description", limit: 50
    t.integer "status"
    t.date "date_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_branches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.string "description", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information_coverages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "validity"
    t.date "final_term"
    t.integer "multiplier_importance_value"
    t.decimal "minimum_importance_value", precision: 17, scale: 2
    t.decimal "maximum_importance_value", precision: 17, scale: 2
    t.decimal "minimum_reference", precision: 7, scale: 4
    t.decimal "maximum_reference", precision: 7, scale: 4
    t.decimal "minimum_premium_reference", precision: 17, scale: 2
    t.boolean "compulsory_coverage"
    t.integer "type_coverage"
    t.integer "type_use"
    t.decimal "rate_pure", precision: 7, scale: 4
    t.decimal "fixed_value", precision: 17, scale: 2
    t.string "description_franchise", limit: 100
    t.integer "status"
    t.date "date_status"
    t.bigint "composition_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composition_product_id"], name: "index_information_coverages_on_composition_product_id"
  end

  create_table "information_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "validity"
    t.decimal "minimum_plot_value", precision: 17, scale: 2
    t.decimal "minimum_policy_value", precision: 17, scale: 2
    t.decimal "discount_limit", precision: 7, scale: 4
    t.decimal "commission_limit", precision: 7, scale: 4
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_information_products_on_product_id"
  end

  create_table "insurers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.string "name", limit: 50
    t.string "contact_name", limit: 50
    t.integer "contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 50
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "percent_deadlines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "quantity_days"
    t.decimal "percentage_aplided", precision: 7, scale: 4
    t.bigint "deadline_short_long_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deadline_short_long_id"], name: "index_percent_deadlines_on_deadline_short_long_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.string "name", limit: 50
    t.text "description", limit: 255
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "insurer_id"
    t.index ["branch_id"], name: "index_products_on_branch_id"
    t.index ["insurer_id"], name: "index_products_on_insurer_id"
  end

  create_table "taxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "validity"
    t.decimal "rate", precision: 7, scale: 4
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deadline_short_long_id"
    t.index ["branch_id"], name: "index_taxes_on_branch_id"
    t.index ["deadline_short_long_id"], name: "index_taxes_on_deadline_short_long_id"
  end

  add_foreign_key "branches", "group_branches"
  add_foreign_key "composition_products", "covers"
  add_foreign_key "composition_products", "products"
  add_foreign_key "covers", "branches"
  add_foreign_key "information_coverages", "composition_products"
  add_foreign_key "information_products", "products"
  add_foreign_key "percent_deadlines", "deadline_short_longs"
  add_foreign_key "products", "branches"
  add_foreign_key "products", "insurers"
  add_foreign_key "taxes", "branches"
  add_foreign_key "taxes", "deadline_short_longs"
end
