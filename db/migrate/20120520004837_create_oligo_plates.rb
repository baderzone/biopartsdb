class CreateOligoPlates < ActiveRecord::Migration
  def change
    create_table :oligo_plates do |t|
      t.string :name
      t.references :vendor
      t.references :user

      t.timestamps
    end
    add_index :oligo_plates, :vendor_id
    add_index :oligo_plates, :user_id
  end
end
