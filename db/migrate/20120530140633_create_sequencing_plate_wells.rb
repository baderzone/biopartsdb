class CreateSequencingPlateWells < ActiveRecord::Migration
  def change
    create_table :sequencing_plate_wells do |t|
      t.references :user
      t.references :sequencing_plate
      t.references :sequencing_growth_plate_well
      t.string :well

      t.timestamps
    end
    add_index :sequencing_plate_wells, :user_id
    add_index :sequencing_plate_wells, :sequencing_plate_id, :name => 'index_spw_sp'
    add_index :sequencing_plate_wells, :sequencing_growth_plate_well_id, :name => 'index_spw_sgpw'
  end
end
