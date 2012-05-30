class AddStatusToSequencingPlate < ActiveRecord::Migration
  def change
    add_column :sequencing_plates, :status_id, :integer
  end
end
