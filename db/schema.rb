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

ActiveRecord::Schema.define(version: 2021_05_22_212624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "git_hub_users", force: :cascade do |t|
    t.string "username", null: false
    t.string "name", null: false
    t.string "avatar_url"
    t.integer "public_repos", default: 0, null: false
    t.integer "followers", default: 0, null: false
    t.integer "following", default: 0, null: false
    t.datetime "since", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repos", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "fork", null: false
    t.text "description"
    t.string "clone_url", null: false
    t.integer "size", null: false
    t.integer "stargazers_count", default: 0, null: false
    t.integer "watchers_count", default: 0, null: false
    t.integer "forks_count", default: 0, null: false
    t.integer "open_issues_count", default: 0, null: false
    t.string "language", null: false
    t.bigint "git_hub_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["git_hub_user_id"], name: "index_repos_on_git_hub_user_id"
  end

  add_foreign_key "repos", "git_hub_users"
end
