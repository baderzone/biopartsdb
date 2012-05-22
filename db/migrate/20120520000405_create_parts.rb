class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.references :location
      t.references :sequence
      t.references :feature

      t.timestamps
    end
    add_index :parts, :location_id
    add_index :parts, :sequence_id
    add_index :parts, :feature_id
  end
end
