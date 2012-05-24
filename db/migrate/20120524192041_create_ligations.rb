class CreateLigations < ActiveRecord::Migration
  def change
    create_table :ligations do |t|
      t.references :user
      t.references :plasmid
      t.references :status
      t.references :quality_control
      t.references :protocol
      t.references :pcr_product, :polymorphic => true

      t.timestamps
    end
    add_index :ligations, :user_id
    add_index :ligations, :plasmid_id
    add_index :ligations, :status_id
    add_index :ligations, :quality_control_id
    add_index :ligations, :protocol_id
  end
end
