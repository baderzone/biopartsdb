class CreateOligoPlateWells < ActiveRecord::Migration
  def change
    create_table :oligo_plate_wells do |t|
      t.references :oligo_plate
      t.references :oligo
      t.string :well

      t.timestamps
    end
    add_index :oligo_plate_wells, :oligo_plate_id
    add_index :oligo_plate_wells, :oligo_id
  end
end
