class CreateCspcrPlateWells < ActiveRecord::Migration
  def change
    create_table :cspcr_plate_wells do |t|
      t.references :cspcr_plate
      t.references :clone
      t.string :well

      t.timestamps
    end
    add_index :cspcr_plate_wells, :cspcr_plate_id
    add_index :cspcr_plate_wells, :clone_id
  end
end
