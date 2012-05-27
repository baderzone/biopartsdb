class CreateCspcrProducts < ActiveRecord::Migration
  def change
    create_table :cspcr_products do |t|
      t.references :user
      t.references :cspcr
      t.references :quality_control
      t.references :clone

      t.timestamps
    end
    add_index :cspcr_products, :user_id
    add_index :cspcr_products, :cspcr_id
    add_index :cspcr_products, :quality_control_id
    add_index :cspcr_products, :clone_id
  end
end
