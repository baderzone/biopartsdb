class CreateFpcrProducts < ActiveRecord::Migration
  def change
    create_table :fpcr_products do |t|
      t.references :user
      t.references :fpcr
      t.references :tpcr_product
      t.references :quality_control

      t.timestamps
    end
    add_index :fpcr_products, :user_id
    add_index :fpcr_products, :fpcr_id
    add_index :fpcr_products, :tpcr_product_id
    add_index :fpcr_products, :quality_control_id
  end
end
