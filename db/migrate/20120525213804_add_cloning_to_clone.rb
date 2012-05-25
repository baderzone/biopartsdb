class AddCloningToClone < ActiveRecord::Migration
  def change
    add_column :clones, :cloning_id, :integer
  end
end
