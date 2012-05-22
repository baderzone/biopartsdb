class CreateApcrs < ActiveRecord::Migration
  def change
    create_table :apcrs do |t|
      t.references :user
      t.references :status
      t.references :protocol
      t.references :device

      t.timestamps
    end
    add_index :apcrs, :status_id
    add_index :apcrs, :protocol_id
    add_index :apcrs, :device_id
  end
end
