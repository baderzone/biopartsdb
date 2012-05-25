class CreateSpcrs < ActiveRecord::Migration
  def change
    create_table :spcrs do |t|
      t.references :user
      t.references :status
      t.references :protocol
      t.references :device

      t.timestamps
    end
    add_index :spcrs, :user_id
    add_index :spcrs, :status_id
    add_index :spcrs, :protocol_id
    add_index :spcrs, :device_id
  end
end
