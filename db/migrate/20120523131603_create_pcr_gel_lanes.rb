class CreatePcrGelLanes < ActiveRecord::Migration
  def change
    create_table :pcr_gel_lanes do |t|
      t.references :pcr_gel
      t.references :quality_control  
      t.references :pcr_product, :polymorphic => true
      
      t.timestamps
    end
    
    add_index :pcr_gel_lanes, :pcr_gel_id
    add_index :pcr_gel_lanes, :quality_control_id
  end
end
