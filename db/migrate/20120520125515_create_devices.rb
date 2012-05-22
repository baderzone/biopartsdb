class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :device_type
      t.string :name

      t.timestamps
    end
    add_index :devices, :device_type_id
  end
end
