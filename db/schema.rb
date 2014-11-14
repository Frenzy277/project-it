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

ActiveRecord::Schema.define(version: 20141114084913) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_projects", force: true do |t|
    t.integer  "category_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_projects", ["category_id"], name: "index_category_projects_on_category_id"
  add_index "category_projects", ["project_id"], name: "index_category_projects_on_project_id"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["job_id"], name: "index_comments_on_job_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "jobs", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "job_name"
    t.string   "status"
    t.string   "week"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "deadline"
  end

  add_index "jobs", ["project_id"], name: "index_jobs_on_project_id"
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.boolean  "like"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "index_likes_on_likeable_id_and_likeable_type"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "messages", force: true do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.text     "body"
    t.datetime "viewed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.string   "status"
    t.string   "slug"
    t.string   "github_url"
    t.string   "heroku_url"
    t.integer  "manager_id"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "project_description"
    t.boolean  "team",                default: false
  end

  add_index "projects", ["manager_id"], name: "index_projects_on_manager_id"

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id"
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "time_zone"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
