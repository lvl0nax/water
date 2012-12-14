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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121213203913) do

  create_table "accessories", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "description"
    t.boolean  "availability"
    t.float    "price"
    t.string   "photo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "url"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "coolers", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "description"
    t.string   "constructiontype"
    t.string   "coolingtype"
    t.float    "heatingtime"
    t.integer  "heatingpower"
    t.float    "coolingtime"
    t.integer  "coolingtemprature"
    t.integer  "coolingpower"
    t.integer  "width"
    t.integer  "height"
    t.integer  "long"
    t.string   "feature"
    t.float    "price"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "photo"
    t.integer  "heatingtemprature"
    t.text     "shortdesc"
  end

  create_table "costs", :force => true do |t|
    t.integer  "waterbottle_id"
    t.integer  "startcount"
    t.integer  "endcount"
    t.float    "price"
    t.boolean  "corporate",      :default => false
    t.boolean  "individual",     :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "costs", ["waterbottle_id"], :name => "index_costs_on_waterbottle_id"

  create_table "infopages", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "description"
    t.boolean  "top"
    t.integer  "column"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "tag"
    t.string   "h1"
    t.string   "url"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
  end

  add_index "infopages", ["category_id"], :name => "index_infopages_on_category_id"

  create_table "newspages", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "short_desc"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "quick_orders", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "phone"
    t.string   "email"
    t.string   "watertype"
    t.string   "volume"
    t.integer  "count"
    t.string   "time"
    t.string   "address"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "day"
    t.date     "date"
  end

  create_table "regions", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "description"
    t.boolean  "mon"
    t.boolean  "tue"
    t.boolean  "wed"
    t.boolean  "thu"
    t.boolean  "fri"
    t.boolean  "sat"
    t.boolean  "sun"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "request_calls", :force => true do |t|
    t.string   "phone"
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specoffers", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "shortdesc"
    t.text     "description"
    t.string   "photo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "name"
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "waterbottles", :force => true do |t|
    t.string   "seotitle"
    t.text     "seodesc"
    t.string   "seokeywords"
    t.string   "title"
    t.text     "description"
    t.string   "maker"
    t.float    "volume"
    t.text     "corporatedesc"
    t.text     "individualdesc"
    t.string   "photo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
