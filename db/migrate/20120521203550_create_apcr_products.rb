class CreateApcrProducts < ActiveRecord::Migration
  def change
    create_table :apcr_products do |t|
      t.references :user
      t.references :apcr
      t.references :quality_control
      t.references :part

      t.timestamps
    end
    add_index :apcr_products, :apcr_id
    add_index :apcr_products, :quality_control_id
    add_index :apcr_products, :part_id
  end
end
