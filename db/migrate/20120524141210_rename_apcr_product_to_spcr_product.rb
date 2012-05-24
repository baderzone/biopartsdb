class RenameApcrProductToSpcrProduct < ActiveRecord::Migration
  def change
      rename_table :apcr_products, :spcr_products
  end
end
