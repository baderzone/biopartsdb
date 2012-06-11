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

ActiveRecord::Schema.define(:version => 20120611205602) do

  create_table "clones", :force => true do |t|
    t.integer  "user_id"
    t.integer  "transformation_id"
    t.integer  "status_id"
    t.integer  "quality_control_id"
    t.integer  "protocol_id"
    t.string   "name"
    t.string   "color"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "cloning_id"
  end

  add_index "clones", ["protocol_id"], :name => "index_clones_on_protocol_id"
  add_index "clones", ["quality_control_id"], :name => "index_clones_on_quality_control_id"
  add_index "clones", ["status_id"], :name => "index_clones_on_status_id"
  add_index "clones", ["transformation_id"], :name => "index_clones_on_transformation_id"
  add_index "clones", ["user_id"], :name => "index_clones_on_user_id"

  create_table "clonings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "growth_plate_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "protocol_id"
  end

  add_index "clonings", ["growth_plate_id"], :name => "index_clonings_on_growth_plate_id"
  add_index "clonings", ["user_id"], :name => "index_clonings_on_user_id"

  create_table "cspcr_gel_images", :force => true do |t|
    t.integer  "cspcr_gel_id"
    t.string   "cspcr_gel_image_file"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "cspcr_gel_images", ["cspcr_gel_id"], :name => "index_cspcr_gel_images_on_cspcr_gel_id"

  create_table "cspcr_gel_lanes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cspcr_gel_id"
    t.integer  "quality_control_id"
    t.integer  "cspcr_product_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "position"
  end

  add_index "cspcr_gel_lanes", ["cspcr_gel_id"], :name => "index_cspcr_gel_lanes_on_cspcr_gel_id"
  add_index "cspcr_gel_lanes", ["cspcr_product_id"], :name => "index_cspcr_gel_lanes_on_cspcr_product_id"
  add_index "cspcr_gel_lanes", ["quality_control_id"], :name => "index_cspcr_gel_lanes_on_quality_control_id"
  add_index "cspcr_gel_lanes", ["user_id"], :name => "index_cspcr_gel_lanes_on_user_id"

  create_table "cspcr_gels", :force => true do |t|
    t.integer  "user_id"
    t.integer  "protocol_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  add_index "cspcr_gels", ["protocol_id"], :name => "index_cspcr_gels_on_protocol_id"
  add_index "cspcr_gels", ["status_id"], :name => "index_cspcr_gels_on_status_id"
  add_index "cspcr_gels", ["user_id"], :name => "index_cspcr_gels_on_user_id"

  create_table "cspcr_plate_wells", :force => true do |t|
    t.integer  "cspcr_plate_id"
    t.integer  "clone_id"
    t.string   "well"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "cspcr_plate_wells", ["clone_id"], :name => "index_cspcr_plate_wells_on_clone_id"
  add_index "cspcr_plate_wells", ["cspcr_plate_id"], :name => "index_cspcr_plate_wells_on_cspcr_plate_id"

  create_table "cspcr_plates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cspcr_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cspcr_plates", ["cspcr_id"], :name => "index_cspcr_plates_on_cspcr_id"
  add_index "cspcr_plates", ["user_id"], :name => "index_cspcr_plates_on_user_id"

  create_table "cspcr_products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cspcr_id"
    t.integer  "quality_control_id"
    t.integer  "clone_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "cspcr_products", ["clone_id"], :name => "index_cspcr_products_on_clone_id"
  add_index "cspcr_products", ["cspcr_id"], :name => "index_cspcr_products_on_cspcr_id"
  add_index "cspcr_products", ["quality_control_id"], :name => "index_cspcr_products_on_quality_control_id"
  add_index "cspcr_products", ["user_id"], :name => "index_cspcr_products_on_user_id"

  create_table "cspcrs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "protocol_id"
    t.integer  "status_id"
    t.integer  "device_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  add_index "cspcrs", ["device_id"], :name => "index_cspcrs_on_device_id"
  add_index "cspcrs", ["protocol_id"], :name => "index_cspcrs_on_protocol_id"
  add_index "cspcrs", ["status_id"], :name => "index_cspcrs_on_status_id"
  add_index "cspcrs", ["user_id"], :name => "index_cspcrs_on_user_id"

  create_table "device_types", :force => true do |t|
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
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

  create_table "fpcr_products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fpcr_id"
    t.integer  "tpcr_product_id"
    t.integer  "quality_control_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "fpcr_products", ["fpcr_id"], :name => "index_fpcr_products_on_fpcr_id"
  add_index "fpcr_products", ["quality_control_id"], :name => "index_fpcr_products_on_quality_control_id"
  add_index "fpcr_products", ["tpcr_product_id"], :name => "index_fpcr_products_on_tpcr_product_id"
  add_index "fpcr_products", ["user_id"], :name => "index_fpcr_products_on_user_id"

  create_table "fpcrs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "protocol_id"
    t.integer  "device_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  add_index "fpcrs", ["device_id"], :name => "index_fpcrs_on_device_id"
  add_index "fpcrs", ["status_id"], :name => "index_fpcrs_on_status_id"
  add_index "fpcrs", ["user_id"], :name => "index_fpcrs_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups_users", ["group_id"], :name => "index_groups_users_on_group_id"
  add_index "groups_users", ["user_id"], :name => "index_groups_users_on_user_id"

  create_table "growth_plate_wells", :force => true do |t|
    t.integer  "clone_id"
    t.integer  "growth_plate_id"
    t.string   "well"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "growth_plate_wells", ["clone_id"], :name => "index_growth_plate_wells_on_clone_id"
  add_index "growth_plate_wells", ["growth_plate_id"], :name => "index_growth_plate_wells_on_growth_plate_id"

  create_table "growth_plates", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "growth_plates", ["user_id"], :name => "index_growth_plates_on_user_id"

  create_table "ligation_products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ligation_id"
    t.integer  "pcr_product_id"
    t.string   "pcr_product_type"
    t.integer  "plasmid_id"
    t.integer  "quality_control_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "part_id"
  end

  add_index "ligation_products", ["ligation_id"], :name => "index_ligation_products_on_ligation_id"
  add_index "ligation_products", ["plasmid_id"], :name => "index_ligation_products_on_plasmid_id"
  add_index "ligation_products", ["quality_control_id"], :name => "index_ligation_products_on_quality_control_id"
  add_index "ligation_products", ["user_id"], :name => "index_ligation_products_on_user_id"

  create_table "ligations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "protocol_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  add_index "ligations", ["protocol_id"], :name => "index_ligations_on_protocol_id"
  add_index "ligations", ["status_id"], :name => "index_ligations_on_status_id"
  add_index "ligations", ["user_id"], :name => "index_ligations_on_user_id"

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

  create_table "pcr_gel_images", :force => true do |t|
    t.integer  "pcr_gel_id"
    t.string   "pcr_gel_image_file"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "pcr_gel_images", ["pcr_gel_id"], :name => "index_pcr_gel_images_on_pcr_gel_id"

  create_table "pcr_gel_lanes", :force => true do |t|
    t.integer  "pcr_gel_id"
    t.integer  "quality_control_id"
    t.integer  "pcr_product_id"
    t.string   "pcr_product_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "position"
  end

  add_index "pcr_gel_lanes", ["pcr_gel_id"], :name => "index_pcr_gel_lanes_on_pcr_gel_id"
  add_index "pcr_gel_lanes", ["quality_control_id"], :name => "index_pcr_gel_lanes_on_quality_control_id"

  create_table "pcr_gels", :force => true do |t|
    t.integer  "user_id"
    t.integer  "protocol_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  add_index "pcr_gels", ["protocol_id"], :name => "index_pcr_gels_on_protocol_id"
  add_index "pcr_gels", ["status_id"], :name => "index_pcr_gels_on_status_id"
  add_index "pcr_gels", ["user_id"], :name => "index_pcr_gels_on_user_id"

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
    t.integer  "scaling_factor"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
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

  create_table "sequencing_growth_plate_wells", :force => true do |t|
    t.integer  "sequencing_growth_plate_id"
    t.integer  "sequencing_product_id"
    t.string   "well"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "sequencing_growth_plate_wells", ["sequencing_growth_plate_id"], :name => "sgpw_sgp_index"
  add_index "sequencing_growth_plate_wells", ["sequencing_product_id"], :name => "sgpw_sp_index"

  create_table "sequencing_growth_plates", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "sequencing_id"
  end

  add_index "sequencing_growth_plates", ["user_id"], :name => "index_sequencing_growth_plates_on_user_id"

  create_table "sequencing_plate_wells", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sequencing_plate_id"
    t.integer  "sequencing_growth_plate_well_id"
    t.string   "well"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "sequencing_plate_wells", ["sequencing_growth_plate_well_id"], :name => "index_spw_sgpw"
  add_index "sequencing_plate_wells", ["sequencing_plate_id"], :name => "index_spw_sp"
  add_index "sequencing_plate_wells", ["user_id"], :name => "index_sequencing_plate_wells_on_user_id"

  create_table "sequencing_plates", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "status_id"
  end

  add_index "sequencing_plates", ["user_id"], :name => "index_sequencing_plates_on_user_id"

  create_table "sequencing_products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sequencing_id"
    t.integer  "part_id"
    t.integer  "clone_id"
    t.integer  "quality_control_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "sequencing_products", ["clone_id"], :name => "index_sequencing_products_on_clone_id"
  add_index "sequencing_products", ["part_id"], :name => "index_sequencing_products_on_part_id"
  add_index "sequencing_products", ["quality_control_id"], :name => "index_sequencing_products_on_quality_control_id"
  add_index "sequencing_products", ["sequencing_id"], :name => "index_sequencing_products_on_sequencing_id"
  add_index "sequencing_products", ["user_id"], :name => "index_sequencing_products_on_user_id"

  create_table "sequencings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "protocol_id"
  end

  add_index "sequencings", ["status_id"], :name => "index_sequencings_on_status_id"
  add_index "sequencings", ["user_id"], :name => "index_sequencings_on_user_id"

  create_table "spcr_products", :force => true do |t|
    t.integer  "spcr_id"
    t.integer  "part_id"
    t.integer  "quality_control_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "spcr_products", ["part_id"], :name => "index_spcr_products_on_part_id"
  add_index "spcr_products", ["quality_control_id"], :name => "index_spcr_products_on_quality_control_id"
  add_index "spcr_products", ["spcr_id"], :name => "index_spcr_products_on_spcr_id"

  create_table "spcrs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.integer  "protocol_id"
    t.integer  "device_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "note"
  end

  add_index "spcrs", ["device_id"], :name => "index_spcrs_on_device_id"
  add_index "spcrs", ["protocol_id"], :name => "index_spcrs_on_protocol_id"
  add_index "spcrs", ["status_id"], :name => "index_spcrs_on_status_id"
  add_index "spcrs", ["user_id"], :name => "index_spcrs_on_user_id"

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
    t.text     "note"
  end

  add_index "tpcrs", ["device_id"], :name => "index_tpcrs_on_device_id"
  add_index "tpcrs", ["protocol_id"], :name => "index_tpcrs_on_protocol_id"
  add_index "tpcrs", ["status_id"], :name => "index_tpcrs_on_status_id"
  add_index "tpcrs", ["user_id"], :name => "index_tpcrs_on_user_id"

  create_table "transformations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ligation_product_id"
    t.integer  "strain_id"
    t.integer  "status_id"
    t.integer  "quality_control_id"
    t.integer  "protocol_id"
    t.integer  "white_count"
    t.integer  "blue_count"
    t.integer  "light_blue_count"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "note"
  end

  add_index "transformations", ["ligation_product_id"], :name => "index_transformations_on_ligation_product_id"
  add_index "transformations", ["protocol_id"], :name => "index_transformations_on_protocol_id"
  add_index "transformations", ["quality_control_id"], :name => "index_transformations_on_quality_control_id"
  add_index "transformations", ["status_id"], :name => "index_transformations_on_status_id"
  add_index "transformations", ["strain_id"], :name => "index_transformations_on_strain_id"
  add_index "transformations", ["user_id"], :name => "index_transformations_on_user_id"

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
