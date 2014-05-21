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

ActiveRecord::Schema.define(version: 20140521060907) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "agreements", force: true do |t|
    t.text     "content",    limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inquiry"
  end

  create_table "faq_categories", force: true do |t|
    t.string   "faq_category_name",                default: "", null: false
    t.text     "faq_category_summary", limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: true do |t|
    t.text     "question",        limit: 255, default: "", null: false
    t.string   "answer",                      default: "", null: false
    t.integer  "faq_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faqs", ["faq_category_id"], name: "index_faqs_on_faq_category_id"

  create_table "friends", force: true do |t|
    t.integer  "user_id1",   default: 0,     null: false
    t.integer  "user_id2",   default: 0,     null: false
    t.boolean  "status",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learnings", force: true do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.boolean  "status",                    default: false
    t.text     "memo",          limit: 255, default: ""
    t.boolean  "check",                     default: false
    t.datetime "complete_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learnings", ["lesson_id"], name: "index_learnings_on_lesson_id"
  add_index "learnings", ["user_id"], name: "index_learnings_on_user_id"

  create_table "lessons", force: true do |t|
    t.string   "title",                         null: false
    t.text     "summary",           limit: 255, null: false
    t.string   "movie"
    t.time     "time"
    t.integer  "grade",                         null: false
    t.string   "category_name",                 null: false
    t.text     "category_summary",  limit: 255, null: false
    t.string   "unit_name",                     null: false
    t.text     "unit_summary",      limit: 255, null: false
    t.string   "unit_item_name",                null: false
    t.text     "unit_item_summary", limit: 255, null: false
    t.text     "explanation",       limit: 255, null: false
    t.text     "exercise",          limit: 255, null: false
    t.text     "exercise_answer",   limit: 255, null: false
    t.text     "point",             limit: 255, null: false
    t.integer  "number",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.text     "message_content", limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["friend_id"], name: "index_messages_on_friend_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "privacies", force: true do |t|
    t.text     "content",    limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                   default: ""
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "user_auth",              default: true
    t.string   "sex"
    t.integer  "grade"
    t.string   "prefecture"
    t.boolean  "mailmag",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
