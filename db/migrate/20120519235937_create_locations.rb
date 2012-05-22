class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :organism
      t.string :chromosome
      t.integer :start
      t.integer :stop
      t.integer :strand

      t.timestamps
    end
    add_index :locations, :organism_id
  end
end
