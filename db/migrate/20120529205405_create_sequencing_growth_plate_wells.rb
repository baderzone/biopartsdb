class CreateSequencingGrowthPlateWells < ActiveRecord::Migration
  def change
    create_table :sequencing_growth_plate_wells do |t|
      t.references :sequencing_growth_plate
      t.references :sequencing_product
      t.string :well

      t.timestamps
    end
    add_index :sequencing_growth_plate_wells, :sequencing_growth_plate_id, :name => 'sgpw_sgp_index'
    add_index :sequencing_growth_plate_wells, :sequencing_product_id, :name => 'sgpw_sp_index'
  end
end
