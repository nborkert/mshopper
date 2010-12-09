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

ActiveRecord::Schema.define(:version => 20101209010522) do

  create_table "clients", :force => true do |t|
    t.string   "contact_name"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "referral_code"
    t.string   "userid"
    t.string   "password_hash"
    t.string   "password_salt"
    t.decimal  "credit_balance"
    t.date     "credit_effective_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geo_queries", :force => true do |t|
    t.decimal  "lat"
    t.decimal  "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geo_queries_stations", :id => false, :force => true do |t|
    t.integer  "geo_query_id"
    t.integer  "station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "geo_queries_stations", ["geo_query_id"], :name => "index_geo_queries_stations_on_geo_query_id"
  add_index "geo_queries_stations", ["station_id"], :name => "index_geo_queries_stations_on_station_id"

  create_table "referrers", :force => true do |t|
    t.string   "contact_name"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "referral_code"
    t.decimal  "referral_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
