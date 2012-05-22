class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.references :organism
      t.references :vendor
      t.string :name

      t.timestamps
    end
    add_index :strains, :organism_id
    add_index :strains, :vendor_id
  end
end
