class CreateSequencingPlates < ActiveRecord::Migration
  def change
    create_table :sequencing_plates do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :sequencing_plates, :user_id
  end
end
