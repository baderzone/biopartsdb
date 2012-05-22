class CreatePlasmids < ActiveRecord::Migration
  def change
    create_table :plasmids do |t|
      t.references :vendor
      t.string :name

      t.timestamps
    end
    add_index :plasmids, :vendor_id
  end
end
