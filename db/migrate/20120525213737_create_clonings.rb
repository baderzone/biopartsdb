class CreateClonings < ActiveRecord::Migration
  def change
    create_table :clonings do |t|
      t.references :user
      t.references :growth_plate

      t.timestamps
    end
    add_index :clonings, :user_id
    add_index :clonings, :growth_plate_id
  end
end
