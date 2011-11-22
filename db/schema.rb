# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100813213817) do

  create_table "allotments", :force => true do |t|
    t.string   "allotment_id"
    t.string   "ref"
    t.string   "name"
    t.string   "area"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_stops", :force => true do |t|
    t.string   "naptan_code"
    t.string   "common_name"
    t.string   "locality_name"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children_centres", :force => true do |t|
    t.integer  "centre_id"
    t.string   "name"
    t.string   "centre_type"
    t.string   "location"
    t.string   "address"
    t.string   "town"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "notes"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leisure_centres", :force => true do |t|
    t.string   "name"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "libraries", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "town"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parks", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "park_id"
    t.string   "ref"
    t.float    "area_hectares"
    t.string   "park_type"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polling_stations", :force => true do |t|
    t.string   "ref"
    t.integer  "prefix"
    t.string   "ward_code"
    t.string   "polling_district_code"
    t.string   "ward_name"
    t.string   "access"
    t.string   "availability"
    t.string   "name"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recycling_sites", :force => true do |t|
    t.string   "site_id"
    t.string   "location"
    t.string   "street"
    t.string   "town"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "facilities"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "urn"
    t.string   "lea"
    t.string   "establishment"
    t.string   "name"
    t.string   "school_type"
    t.string   "email"
    t.string   "url"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "train_stations", :force => true do |t|
    t.string   "crs_code"
    t.string   "name"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trees", :force => true do |t|
    t.string   "tree_ref"
    t.string   "species"
    t.string   "locality_name"
    t.string   "district_name"
    t.float    "height"
    t.string   "dbh"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
