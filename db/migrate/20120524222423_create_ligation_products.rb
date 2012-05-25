class CreateLigationProducts < ActiveRecord::Migration
  def change
    create_table :ligation_products do |t|
      t.references :user
      t.references :ligation
      t.references :pcr_product, :polymorphic => true
      t.references :plasmid
      t.references :quality_control
      
      t.timestamps
    end
    add_index :ligation_products, :user_id
    add_index :ligation_products, :plasmid_id
    add_index :ligation_products, :quality_control_id
    add_index :ligation_products, :ligation_id
  end
end
