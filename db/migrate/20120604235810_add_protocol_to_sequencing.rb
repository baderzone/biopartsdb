class AddProtocolToSequencing < ActiveRecord::Migration
  def change
    add_column :sequencings, :protocol_id, :integer
  end
end
