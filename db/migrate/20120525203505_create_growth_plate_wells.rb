class CreateGrowthPlateWells < ActiveRecord::Migration
  def change
    create_table :growth_plate_wells do |t|
      t.references :clone
      t.references :growth_plate
      t.string :well

      t.timestamps
    end
    add_index :growth_plate_wells, :clone_id
    add_index :growth_plate_wells, :growth_plate_id
  end
end
