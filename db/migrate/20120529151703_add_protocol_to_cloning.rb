class AddProtocolToCloning < ActiveRecord::Migration
  def change
    add_column :clonings, :protocol_id, :integer
  end
end
