class CreateSpcrProducts < ActiveRecord::Migration
  def change
    create_table :spcr_products do |t|
      t.references :spcr
      t.references :part
      t.references :quality_control

      t.timestamps
    end
    add_index :spcr_products, :spcr_id
    add_index :spcr_products, :part_id
    add_index :spcr_products, :quality_control_id
  end
end
