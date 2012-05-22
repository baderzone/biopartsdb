class AddDefaultToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :default, :bool
  end
end
