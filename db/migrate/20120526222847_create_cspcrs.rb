class CreateCspcrs < ActiveRecord::Migration
  def change
    create_table :cspcrs do |t|
      t.references :user
      t.references :protocol
      t.references :status
      t.references :device

      t.timestamps
    end
    add_index :cspcrs, :user_id
    add_index :cspcrs, :protocol_id
    add_index :cspcrs, :status_id
    add_index :cspcrs, :device_id
  end
end
