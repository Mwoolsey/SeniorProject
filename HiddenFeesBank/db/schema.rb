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

ActiveRecord::Schema.define(version: 20170505025457) do

  create_table "accounts", force: :cascade do |t|
    t.decimal  "balance"
    t.integer  "acctType"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ssn"
    t.string   "accountName"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "auto_bill_payments", force: :cascade do |t|
    t.integer  "destinationAcctNumber"
    t.decimal  "amount"
    t.string   "businessName"
    t.string   "businessAddress"
    t.date     "dateToPay"
    t.integer  "account_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "frequency"
    t.index ["account_id"], name: "index_auto_bill_payments_on_account_id"
  end

  create_table "internal_transfers", force: :cascade do |t|
    t.integer  "destinationAcctNumber"
    t.decimal  "amount"
    t.integer  "account_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["account_id"], name: "index_internal_transfers_on_account_id"
  end

  create_table "outgoing_transfers", force: :cascade do |t|
    t.integer  "destinationAcctNumber"
    t.integer  "routingNumber"
    t.decimal  "amount"
    t.integer  "account_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["account_id"], name: "index_outgoing_transfers_on_account_id"
  end

  create_table "sms_alerts", force: :cascade do |t|
    t.integer  "alertType"
    t.integer  "frequency"
    t.integer  "account_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.datetime "next_alert"
    t.integer  "trigger_criteria"
    t.decimal  "trigger_amount"
    t.string   "carrier"
    t.integer  "phone",            limit: 10
    t.index ["account_id"], name: "index_sms_alerts_on_account_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "transactionNumber"
    t.string   "description"
    t.decimal  "amount"
    t.string   "status"
    t.integer  "account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.decimal  "currentBalance"
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_user_accounts_on_account_id"
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",                               null: false
    t.string   "email",                  default: "",                               null: false
    t.string   "encrypted_password",     default: "",                               null: false
    t.string   "address",                default: "123 State St. Chico, CA, 95973", null: false
    t.string   "phone",                  default: "5555555555",                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "ssn"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
