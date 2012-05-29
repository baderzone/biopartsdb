class CreateSequencings < ActiveRecord::Migration
  def change
    create_table :sequencings do |t|
      t.references :user
      t.references :status
      t.references :sequencing_growth_plate

      t.timestamps
    end
    add_index :sequencings, :user_id
    add_index :sequencings, :status_id
    add_index :sequencings, :sequencing_growth_plate_id
  end
end
