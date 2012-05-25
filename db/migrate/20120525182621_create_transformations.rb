class CreateTransformations < ActiveRecord::Migration
  def change
    create_table :transformations do |t|
      t.references :user
      t.references :ligation_product
      t.references :strain
      t.references :status
      t.references :quality_control
      t.references :protocol
      t.integer :white_count
      t.integer :blue_count
      t.integer :light_blue_count

      t.timestamps
    end
    add_index :transformations, :user_id
    add_index :transformations, :ligation_product_id
    add_index :transformations, :strain_id
    add_index :transformations, :status_id
    add_index :transformations, :quality_control_id
    add_index :transformations, :protocol_id
  end
end
