class CreateCspcrGelLanes < ActiveRecord::Migration
  def change
    create_table :cspcr_gel_lanes do |t|
      t.references :user
      t.references :cspcr_gel
      t.references :quality_control
      t.references :cspcr_product

      t.timestamps
    end
    add_index :cspcr_gel_lanes, :user_id
    add_index :cspcr_gel_lanes, :cspcr_gel_id
    add_index :cspcr_gel_lanes, :quality_control_id
    add_index :cspcr_gel_lanes, :cspcr_product_id
  end
end
