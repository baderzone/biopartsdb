class AddPartToLigationProduct < ActiveRecord::Migration
  def change
    add_column :ligation_products, :part_id, :integer
  end
end
