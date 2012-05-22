class CreateProtocolReagents < ActiveRecord::Migration
  def change
    create_table :protocol_reagents do |t|
      t.references :protocol
      t.string :name
      t.string :stock_concentration
      t.string :final_concentration
      t.string :volume_reaction

      t.timestamps
    end
    add_index :protocol_reagents, :protocol_id
  end
end
