class RemoveSequencingGrowthPlateFromSequencing < ActiveRecord::Migration
  def up
    remove_column :sequencings, :sequencing_growth_plate_id
  end

  def down
    add_column :sequencings, :sequencing_growth_plate, :string
  end
end
