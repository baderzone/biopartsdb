class AddMasterPlateToSequencingPlate < ActiveRecord::Migration
  def change
    add_column :sequencing_plates, :master_plate_id, :integer
  end
end
