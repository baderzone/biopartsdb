class AddPositionToPcrGelLane < ActiveRecord::Migration
  def change
    add_column :pcr_gel_lanes, :position, :integer
  end
end
