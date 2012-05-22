class CreateOligos < ActiveRecord::Migration
  def change
    create_table :oligos do |t|
      t.references :part
      t.string :name
      t.integer :start
      t.integer :stop
      t.string :sequence

      t.timestamps
    end
    add_index :oligos, :part_id
  end
end
