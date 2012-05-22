class CreateCspcrProducts < ActiveRecord::Migration
  def change
    create_table :cspcr_products do |t|
      t.references :user
      t.references :tpcr
      t.references :quality_control
      t.references :part

      t.timestamps
    end
    add_index :cspcr_products, :user_id
    add_index :cspcr_products, :tpcr_id
    add_index :cspcr_products, :quality_control_id
    add_index :cspcr_products, :part_id
  end
end
