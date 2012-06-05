class AddPositionToCspcrGelLane < ActiveRecord::Migration
  def change
    add_column :cspcr_gel_lanes, :position, :integer
  end
end
