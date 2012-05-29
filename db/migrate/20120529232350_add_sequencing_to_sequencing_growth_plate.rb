class AddSequencingToSequencingGrowthPlate < ActiveRecord::Migration
  def change
    add_column :sequencing_growth_plates, :sequencing_id, :integer
  end
end
