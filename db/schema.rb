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

ActiveRecord::Schema.define(:version => 20120522183859) do

  create_table "apcr_products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "apcr_id"
    t.integer  "quality_control_id"
    t.integer  "part_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "apcr_products", ["apcr_id"], :name => "index_apcr_products_on_apcr_id"
  add_index "apcr_products", ["part_id"], :name => "index_apcr_products_on_part_id"
  add_index "apcr_products", ["quality_control_id"], :name => "index_apcr_products_on_quality_control_id"

  create_table "apcrs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "protocol_id"
    t.integer  "device_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "apcrs", ["device_id"], :name => "index_apcrs_on_device_id"
  add_index "apcrs", ["protocol_id"], :name => "index_apcrs_on_protocol_id"
  add_index "apcrs", ["status_id"], :name => "index_apcrs_on_status_id"

  create_table "device_types", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "devices", :force => true do |t|
    t.integer  "device_type_id"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "devices", ["device_type_id"], :name => "index_devices_on_device_type_id"

  create_table "features", :force => true do |t|
    t.string   "so"
    t.string   "name"
    t.string   "namespace"
    t.text     "definition"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "organism_id"
    t.string   "chromosome"
    t.integer  "start"
    t.integer  "stop"
    t.integer  "strand"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "locations", ["organism_id"], :name => "index_locations_on_organism_id"

  create_table "oligo_plate_wells", :force => true do |t|
    t.integer  "oligo_plate_id"
    t.integer  "oligo_id"
    t.string   "well"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "oligo_plate_wells", ["oligo_id"], :name => "index_oligo_plate_wells_on_oligo_id"
  add_index "oligo_plate_wells", ["oligo_plate_id"], :name => "index_oligo_plate_wells_on_oligo_plate_id"

  create_table "oligo_plates", :force => true do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oligo_plates", ["user_id"], :name => "index_oligo_plates_on_user_id"
  add_index "oligo_plates", ["vendor_id"], :name => "index_oligo_plates_on_vendor_id"

  create_table "oligos", :force => true do |t|
    t.integer  "part_id"
    t.string   "name"
    t.integer  "start"
    t.integer  "stop"
    t.string   "sequence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "oligos", ["part_id"], :name => "index_oligos_on_part_id"

  create_table "organisms", :force => true do |t|
    t.string   "name"
    t.string   "latin"
    t.string   "gbtaxonid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.integer  "sequence_id"
    t.integer  "feature_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "parts", ["feature_id"], :name => "index_parts_on_feature_id"
  add_index "parts", ["location_id"], :name => "index_parts_on_location_id"
  add_index "parts", ["sequence_id"], :name => "index_parts_on_sequence_id"

  create_table "plasmids", :force => true do |t|
    t.integer  "vendor_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "plasmids", ["vendor_id"], :name => "index_plasmids_on_vendor_id"

  create_table "protocol_reagents", :force => true do |t|
    t.integer  "protocol_id"
    t.string   "name"
    t.string   "stock_concentration"
    t.string   "final_concentration"
    t.string   "volume_reaction"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "protocol_reagents", ["protocol_id"], :name => "index_protocol_reagents_on_protocol_id"

  create_table "protocols", :force => true do |t|
    t.string   "process"
    t.string   "name"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "protocols", ["user_id"], :name => "index_protocols_on_user_id"

  create_table "quality_controls", :force => true do |t|
    t.string   "process"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sequences", :force => true do |t|
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "process"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "default"
  end

  create_table "strains", :force => true do |t|
    t.integer  "organism_id"
    t.integer  "vendor_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "strains", ["organism_id"], :name => "index_strains_on_organism_id"
  add_index "strains", ["vendor_id"], :name => "index_strains_on_vendor_id"

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "part_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tasks", ["part_id"], :name => "index_tasks_on_part_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "tpcr_products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tpcr_id"
    t.integer  "quality_control_id"
    t.integer  "part_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "tpcr_products", ["part_id"], :name => "index_tpcr_products_on_part_id"
  add_index "tpcr_products", ["quality_control_id"], :name => "index_tpcr_products_on_quality_control_id"
  add_index "tpcr_products", ["tpcr_id"], :name => "index_tpcr_products_on_tpcr_id"
  add_index "tpcr_products", ["user_id"], :name => "index_tpcr_products_on_user_id"

  create_table "tpcrs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "protocol_id"
    t.integer  "device_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tpcrs", ["device_id"], :name => "index_tpcrs_on_device_id"
  add_index "tpcrs", ["protocol_id"], :name => "index_tpcrs_on_protocol_id"
  add_index "tpcrs", ["status_id"], :name => "index_tpcrs_on_status_id"
  add_index "tpcrs", ["user_id"], :name => "index_tpcrs_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.string   "fullname"
    t.string   "email"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
