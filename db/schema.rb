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

ActiveRecord::Schema.define(:version => 20120703145855) do

  create_table "banners", :force => true do |t|
    t.text     "texto"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgbanner_file_name"
    t.string   "imgbanner_content_type"
    t.integer  "imgbanner_file_size"
    t.datetime "imgbanner_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "highlights_file_name"
    t.string   "highlights_content_type"
    t.integer  "highlights_file_size"
    t.datetime "highlights_updated_at"
    t.integer  "line_id"
  end

  create_table "colors", :force => true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgpallete_file_name"
    t.string   "imgpallete_content_type"
    t.integer  "imgpallete_file_size"
    t.datetime "imgpallete_updated_at"
    t.string   "imgenamel_file_name"
    t.string   "imgenamel_content_type"
    t.integer  "imgenamel_file_size"
    t.datetime "imgenamel_updated_at"
    t.string   "imghand_file_name"
    t.string   "imghand_content_type"
    t.integer  "imghand_file_size"
    t.datetime "imghand_updated_at"
    t.text     "tip"
    t.decimal  "modern",                  :precision => 10, :scale => 1, :default => 0.0
    t.integer  "modern_total",                                           :default => 0
    t.decimal  "conservative",            :precision => 10, :scale => 1, :default => 0.0
    t.integer  "conservative_total",                                     :default => 0
    t.decimal  "sexy",                    :precision => 10, :scale => 1, :default => 0.0
    t.integer  "sexy_total",                                             :default => 0
    t.decimal  "day",                     :precision => 10, :scale => 1, :default => 0.0
    t.integer  "day_total",                                              :default => 0
    t.decimal  "night",                   :precision => 10, :scale => 1, :default => 0.0
    t.integer  "night_total",                                            :default => 0
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.string   "phone"
    t.text     "message"
    t.boolean  "receive"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "curriculum_file_name"
    t.string   "curriculum_content_type"
    t.integer  "curriculum_file_size"
    t.datetime "curriculum_updated_at"
    t.integer  "contact_type"
    t.string   "city"
    t.string   "state"
  end

  create_table "lines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgline_file_name"
    t.string   "imgline_content_type"
    t.integer  "imgline_file_size"
    t.datetime "imgline_updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "sumary"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "imagehead_file_name"
    t.string   "imagehead_content_type"
    t.integer  "imagehead_file_size"
    t.datetime "imagehead_updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resellers", :force => true do |t|
    t.string   "name"
    t.string   "fantasy_name"
    t.string   "address"
    t.string   "number"
    t.string   "neibourhood"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "last_name"
    t.string   "email",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token",                  :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
