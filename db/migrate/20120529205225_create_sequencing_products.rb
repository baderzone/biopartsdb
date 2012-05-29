class CreateSequencingProducts < ActiveRecord::Migration
  def change
    create_table :sequencing_products do |t|
      t.references :user
      t.references :sequencing
      t.references :part
      t.references :clone
      t.references :quality_control

      t.timestamps
    end
    add_index :sequencing_products, :user_id
    add_index :sequencing_products, :sequencing_id
    add_index :sequencing_products, :part_id
    add_index :sequencing_products, :clone_id
    add_index :sequencing_products, :quality_control_id
  end
end
