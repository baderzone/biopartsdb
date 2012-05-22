class CreateTpcrs < ActiveRecord::Migration
  def change
    create_table :tpcrs do |t|
      t.references :user
      t.references :status
      t.references :protocol
      t.references :device

      t.timestamps
    end
    add_index :tpcrs, :user_id
    add_index :tpcrs, :status_id
    add_index :tpcrs, :protocol_id
    add_index :tpcrs, :device_id
  end
end
