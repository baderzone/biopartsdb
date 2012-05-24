class ChangeApcrReferencesToSpcrReferences < ActiveRecord::Migration
  def up
    rename_column :spcr_products, :apcr_id, :spcr_id
  end

  def down
    rename_column :spcr_products, :spcr_id, :apcr_id
  end
end
