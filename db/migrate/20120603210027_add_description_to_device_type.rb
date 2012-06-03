class AddDescriptionToDeviceType < ActiveRecord::Migration
  def change
    add_column :device_types, :description, :string
  end
end
