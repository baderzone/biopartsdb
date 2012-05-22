class CreateTpcrProducts < ActiveRecord::Migration
  def change
    create_table :tpcr_products do |t|
      t.references :user
      t.references :tpcr
      t.references :quality_control
      t.references :part

      t.timestamps
    end
    add_index :tpcr_products, :user_id
    add_index :tpcr_products, :tpcr_id
    add_index :tpcr_products, :quality_control_id
    add_index :tpcr_products, :part_id
  end
end
